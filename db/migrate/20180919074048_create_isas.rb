class CreateIsas < ActiveRecord::Migration[5.2]
  def change
    create_table :isas do |t|
      t.string :name

      t.timestamps
    end
  end
end
