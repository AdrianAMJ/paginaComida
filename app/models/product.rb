class Product < ApplicationRecord
    validates :name, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :description, presence: true

    enum category: {
        entrada: "Entrada",
        plato_principal: "Plato Principal",
        postre: "Postre",
    }
end
