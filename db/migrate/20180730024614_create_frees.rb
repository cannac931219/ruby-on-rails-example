class CreateFrees < ActiveRecord::Migration[5.2]
  def change
    create_table :frees do |t|
      t.text :city
      t.text :high
      t.text :low

      t.timestamps
    end
  end
end
