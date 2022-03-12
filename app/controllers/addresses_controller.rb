class AddressesController < ApplicationController
    def index
        if user_signed_in? && current_user.id == params[:user_id].to_i
            @addresses = Address.where(user_id: current_user.id)
        else
            flash[:error] = "Debes haber iniciado sesión"
            redirect_to products_path
        end
    end
end
