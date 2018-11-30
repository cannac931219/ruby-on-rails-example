class CreateBooklists < ActiveRecord::Migration[5.2]
  def change
    create_table :booklists do |t|
      t.text :body
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
