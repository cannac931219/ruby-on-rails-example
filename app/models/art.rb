# require 'elasticsearch'
# require 'elasticsearch/model'
class Art < ApplicationRecord
	# has_many :booklist, dependent: :destroy
	# has_many :booklist, dependent: :delete_all
	# 

	# include Tire::Model::Search
	# include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  searchkick

	# def search_data
 #    { 
 #    	title: title,
 #      content: content 
 #    }
 #  end
  # Art.reindex
 

	has_one :booklist, dependent: :destroy
	validates :title, presence: true, 
	                  length: { minimum: 5 }


  
	# def self.elasticsearch(params = {}, options = {})
	#   key = params[:key].blank? ? "*" : params[:key] # 关键字
	#   params[:page] ||= 1 # 分页
	#   params[:per_page] ||= 20 # 每页条数
	#   # where_hash = {
	#   #   status: 'success', # 固定筛选值
	#   # }
	#   # conditions = {where: where_hash}
	#   conditions = {}
	#   conditions[:page] = params[:page]
	#   conditions[:per_page] = params[:per_page]
	#   search key, conditions
	# end


end
