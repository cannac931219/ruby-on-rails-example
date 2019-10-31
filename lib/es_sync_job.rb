class EsSyncJob < ApplicationJob
  queue_as :default

  def perform table_name,id
    $logger.info('begin sync_elasticsearch queue')
    begin
      table_name.classify.safe_constantize.where(id: id).import
    rescue => e
      $logger.info("sync_elasticsearch error: #{e.message}")
    end
  end
end