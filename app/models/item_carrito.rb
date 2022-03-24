class ItemCarrito < ApplicationRecord
    belongs_to :carrito, foreign_key: :carrito_id
    belongs_to :product, foreign_key: :product_id

    validates :carrito, presence: true
    validates :product, presence: true
end
