class CreateItemCarritos < ActiveRecord::Migration[6.1]
  def change
    create_table :item_carritos do |t|
      t.references :carrito, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
