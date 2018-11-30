class CreateRecharges < ActiveRecord::Migration[5.2]
  def change
    create_table :recharges do |t|
      t.text :money
      t.integer :bank_card_id
      t.text :bank_card
      t.text :recharge_user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
