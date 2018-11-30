class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.text :city
      t.text :high
      t.text :low

      t.timestamps
    end
  end
end
