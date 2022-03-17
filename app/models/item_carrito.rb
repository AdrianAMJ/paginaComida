class ItemCarrito < ApplicationRecord
    belongs_to :carrito, foreign_key: :carrito_id
    belongs_to :product, foreign_key: :product_id
end
