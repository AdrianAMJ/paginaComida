class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def create
        @product = Product.create(params)
    end

    def entradas
        @products = Product.where(category: "Entrada")
    end

    def platos_principales
        @products = Product.where(category: "Plato Principal")
    end

    def postres
        @products = Product.where(category: "Postre")
    end

    private

    def product_params
        params.require(:assign).permit(
          :name,
          :description,
          :category,
          :price,
          :photo_url,
        )
      end
end
