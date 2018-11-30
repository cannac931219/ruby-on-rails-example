class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.text :username
      t.text :sex

      t.timestamps
    end
    create_join_table :clients, :docs
  end
end
