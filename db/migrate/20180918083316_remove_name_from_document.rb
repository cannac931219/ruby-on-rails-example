class RemoveNameFromDocument < ActiveRecord::Migration[5.2]
  def change
    remove_column :documents, :name, :string
  end
end
