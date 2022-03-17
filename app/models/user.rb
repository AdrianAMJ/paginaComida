class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :phone, numericality: { only_integer: true}, length: {minimum:9, maximum:9}, presence: true

  has_many :addresses, foreign_key: "user_id"
  has_one :carrito, foreign_key: "user_id"

  def direcciones
    Address.where(user_id: id).all
  end

  def carrito_compras
    if Carrito.find_by(user_id: id).nil?
      Carrito.create(user_id: id, address_id: nil, total_cost: 0)
    else
      Carrito.find_by(user_id: id)
    end
  end
end
