require "elasticsearch/model"
module SyncModerElasticsearch
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    extend ElasticsearchCallback
    # include Elasticsearch::Model::Callbacks
    synchronization
    mapping{
      indexes :suggested_price, type: :float
      indexes :lowest_price, type: :float
      indexes :sales_volume, type: :integer
    }
    after_commit :sync_elasticsearch, on: [:create, :update]
  end

  def as_indexed_json(options = {})
    {
    	id: id,
    	name: name,
    	name_cn: name_cn,
    	order_item: {
    	  id: _id,
    	  name: _name
    	}
    }
  end
  
  private

  def sync_elasticsearch
    self.import
    _table_name, _id = self.class.table_name, self.id
    EsSyncJob.set(table_name: _table_name, id: _id)
  end

end