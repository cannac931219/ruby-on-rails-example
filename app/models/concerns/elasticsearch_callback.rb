module ElasticsearchCallback
  extend ActiveSupport::Concern

  def synchronization
    after_commit on: [:create] do
      begin
        $logger.info('同步创建', self)
        self.__elasticsearch__.index_document
      rescue => e
        $logger.info(self, e)
        begin
          self.__elasticsearch__.index_document
        rescue => e
          $logger.info(self, e)
        end
      end
    end

    after_commit on: [:update] do
      begin
        $logger.info('同步更新', self)
        self.__elasticsearch__.update_document
      rescue => e
        $logger.info(self, e)
        begin
          self.__elasticsearch__.update_document
        rescue => e
          $logger.info(self, e)
        end
      end
    end

    after_commit on: [:destroy] do
      begin
        $logger.info('同步删除', self)
        self.__elasticsearch__.delete_document
      rescue => e
        $logger.info(self, e)
        begin
          self.__elasticsearch__.delete_document
        rescue => e
          $logger.info(self, e)
        end
      end
    end
	end

end