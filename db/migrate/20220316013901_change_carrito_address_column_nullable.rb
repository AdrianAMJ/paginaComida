class ChangeCarritoAddressColumnNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :carritos, :address_id, true
  end
end
