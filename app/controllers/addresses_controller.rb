class AddressesController < ApplicationController
  def index
    if user_signed_in? && current_user.id == params[:user_id].to_i
      @addresses = Address.where(user_id: current_user.id)
    else
      flash[:error] = "Debes haber iniciado sesión"
      redirect_to products_path
    end
  end

  def new
    @address = Address.new(create_params)
    @address.user_id = current_user.id
    if @address.save
      flash[:success] = "Dirección añadida con exito."
    else
      flash[:error] = "No se pudo añadir la dirección, porfavor intente denuevo."
    end
    redirect_to user_addresses_path(current_user.id)
  end

  def destroy
    if user_signed_in? && current_user.id == params[:user_id].to_i
      @address = Address.find(params[:id])
      if @address.destroy
        flash[:success] = "Se ha eliminado con exito la dirección."
      else
        flash[:error] = "No se pudo eliminar la dirección, porfavor intente denuevo."
      end
      redirect_to user_addresses_path(current_user.id)
    else
      flash[:error] = "Debes haber iniciado sesión"
      redirect_to products_path
    end
  end

  private

  def create_params
    params.require(:address).permit(:direccion, :comuna, :oficina, :user_id)
  end


end
