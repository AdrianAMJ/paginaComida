class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :direccion, null: false
      t.string :comuna, null: false
      t.string :oficina, null: true
      t.timestamps
    end
  end
end
