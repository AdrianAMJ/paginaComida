class CreateCarritos < ActiveRecord::Migration[6.1]
  def change
    create_table :carritos do |t|
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.bigint :total_cost, null: false, default: 0
      t.string :descuento, null: true
      t.timestamps
    end
  end
end
