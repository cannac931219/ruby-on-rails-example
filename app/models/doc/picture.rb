class Doc::Picture < Doc
	mount_uploader :file, PictureUploader

  # 在验证前,先生成md5hash
	before_validation :compute_hash

  # 如果验证md5hash的结果没有错误是true（md5hash 是字段值）
  validates :md5hash, presence: true

  # 唯一性验证
  validates_uniqueness_of :md5hash, :on => :create

  def find_or_create(attributes)
    # 获取数据file参数
    self.file = attributes
    # 进行MD5 存储文件（本身->摘要）
    md5 = Digest::MD5.hexdigest(self.file.read)
    # binding.pry
    # 将self.file 为modle 值的内容。
    # before :cache, :save_original_filename
    # 找数据的md5字段 = md5的数据
    exist_model = Doc::Picture.find_by_md5hash(md5)
    # 如果这个数据存在，结果就等于这个数据；
    # 如果不存在，就将自己存储在doc中
    if exist_model.present?
      result = exist_model
    else
      self.save!
      result = self
    end
    result
  end


  protected
  def compute_hash
    self.md5hash = Digest::MD5.hexdigest(self.file.read)
  end
end
