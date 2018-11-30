class DocController < ApplicationController
	layout 'admin'

	def index
	end

	def create
		p params[:file]
		client_id = 1
		client = Client.find(client_id)

		# 添加事务回滚
		ActiveRecord::Base.transaction do
			# 获取参数file
			file = params[:file]
			# 生成创建model doc：：类picture下的find_or_create方法实例化 新建
			doc = Doc::Picture.new.find_or_create(file)
			# 如果这个上传的文件不存在的话 进行保存
			unless client.docs.exists?(doc.id)
				# 将这个对象doc 添加到 client.docs 这个数组对象集中
				# 因为 client 和 doc 是关联关系，所以通过save进行 client_doc表中id数据的存储
				client.docs << doc 
				client.save!
			end
		end
	end

end
