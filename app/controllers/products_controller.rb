class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def create
        @product = Product.new(create_params)
        if @product.save
            flash[:success] = "Producto creado con exito."
        else
            flash[:error] = "No se pudo crear el producto, porfavor intente denuevo."
        end
        redirect_to products_path
    end

    def update
        @product = Product.find(params[:product_id])
        @product.update(create_params)

        if @product.save
            flash[:success] = "Producto actualizado con exito"
            redirect_to products_path
        else
            flash[:error] = "No se pudo actualizar el producto, porfavor intente denuevo."
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
