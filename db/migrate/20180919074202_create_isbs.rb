class CreateIsbs < ActiveRecord::Migration[5.2]
  def change
    create_table :isbs do |t|
      t.string :isbname
      t.references :isa

      t.timestamps
    end
  end
end
