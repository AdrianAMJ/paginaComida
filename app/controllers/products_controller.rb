class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def create
        @product = Product.new(create_params)
        if @product.save
            flash[:notice] = "#{@product.name} añadido."
            redirect_to products_path
        else
            flash[:alert] = "No se pudo crear el Producto."
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
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
    def create_params
      params.require(:product).permit(:name, :category, :price, :description, :photo_url)
    end

end
