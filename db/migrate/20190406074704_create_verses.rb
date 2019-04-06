class CreateVerses < ActiveRecord::Migration[5.2]
  def change
    create_table :verses do |t|
      t.string :need
      t.string :theme
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
