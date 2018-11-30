class CreateAboutMes < ActiveRecord::Migration[5.2]
  def change
    create_table :about_mes do |t|
      t.integer :age
      t.string :name

      t.timestamps
    end
  end
end
