class Address < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"

    validates :direccion, presence: true
    validates :comuna, presence: true

    enum comuna: {
        las_condes: 'Las Condes',
        la_reina: 'La Reina',
        providencia: 'Providencia',
        vitacura: 'Vitacura',
        nunoa: 'Ñuñoa',
    }
  
end
