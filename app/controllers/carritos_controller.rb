class CarritosController < ApplicationController
    def index
        if user_signed_in? && current_user.id == params[:user_id].to_i
            @carrito = current_user.carrito_compras
            @items = ItemCarrito.joins(:product).where(carrito_id: @carrito.id).select(:product_id).distinct.order(:name)
        else
            flash[:error] = "Debes iniciar sesión."
            redirect_to products_path   
        end
    end

    def agregar_item
        if user_signed_in? && current_user.id == params[:user_id].to_i
            @carrito = current_user.carrito_compras
            @carrito.agregar_producto(params[:product_id])
            flash[:success] = "Se agrego el producto con exito."
        else
            flash[:error] = "No se pudo agregar el producto."
        end
        redirect_back(fallback_location: products_path)
    end

    def quitar_item
        if user_signed_in? && current_user.id == params[:user_id].to_i
            @carrito = current_user.carrito_compras
            item = ItemCarrito.where(carrito_id: @carrito.id, product_id: params[:product_id]).first
            price = Product.find(params[:product_id]).price
            if item.destroy
                @carrito.total_cost -= price
                @carrito.save
            end
        end
        redirect_back(fallback_location: products_path)
    end
end
