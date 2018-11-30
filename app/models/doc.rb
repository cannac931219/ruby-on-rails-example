class Doc < ApplicationRecord
	before_save :update_base_attributes

  def download_url
    self.file.url
  end

  private
  def update_base_attributes
    if file.present? && file_changed?
      self.content_type = file.file.content_type
      self.file_size = file.file.size
    end
  end
end
