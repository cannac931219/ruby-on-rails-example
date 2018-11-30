class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.boolean :is_censorded
      t.attachment :document

      t.timestamps
    end
  end
end
