class Carrito < ApplicationRecord
    validates :user, presence: true

    belongs_to :user, foreign_key: "user_id"
    belongs_to :address, foreign_key: "address_id", optional: true
    has_many :item_carrito, foreign_key: "carrito_id"

    def items
        ItemCarrito.where(carrito_id: id).all
    end

    def agregar_producto product_id
        ItemCarrito.create(carrito: self, product_id: product_id)
        self.total_cost += Product.find(product_id).price
        self.save
    end
end

