class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :user_name
      t.integer :tel
      t.integer :id_card

      t.timestamps
    end
  end
end
