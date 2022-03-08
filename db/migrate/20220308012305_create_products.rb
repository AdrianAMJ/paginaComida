class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :description, null: false
      t.string :photo_url
      t.bigint :price, null:false
      t.timestamps
    end
  end
end
