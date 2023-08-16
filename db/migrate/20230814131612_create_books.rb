class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :genre
      t.text :description
      t.string :cover_image

      t.timestamps
    end
  end
end
