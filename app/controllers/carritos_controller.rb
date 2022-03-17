class CarritosController < ApplicationController
    def index
        if user_signed_in? && current_user.id == params[:user_id].to_i
            @carrito = Carrito.find_by(user_id: params[:user_id])
            @items = ItemCarrito.where(carrito_id: @carrito.id).select(:product_id).distinct
        else
            flash[:error] = "Debes iniciar sesión."
            redirect_to products_path   
        end
    end

    def agregar_item
        if user_signed_in? && current_user.id == params[:user_id].to_i
            @carrito = Carrito.find(params[:carrito_id])
            @carrito.agregar_producto(params[:product_id])
            flash[:success] = "Se agrego el producto con exito."
        else
            flash[:error] = "No se pudo agregar el producto."
        end
        redirect_to products_path
    end
end
