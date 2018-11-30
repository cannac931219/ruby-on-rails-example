class CreateHelperuses < ActiveRecord::Migration[5.2]
  def change
    create_table :helperuses do |t|
      t.text :text
      t.text :textereas

      t.timestamps
    end
  end
end
