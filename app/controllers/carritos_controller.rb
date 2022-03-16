class CarritosController < ApplicationController
    def index
        if user_signed_in? && current_user.id == params[:user_id].to_i

        else
            flash[:error] = "Debes iniciar sesión."
            redirect_to products_path   
        end
    end

end
