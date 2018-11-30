class CreateDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :docs do |t|
      t.string :original_filename
      t.string :file
      t.string :content_type
      t.integer :file_size
      t.string :type
      t.text :md5hash

      t.timestamps
    end
  end
end
