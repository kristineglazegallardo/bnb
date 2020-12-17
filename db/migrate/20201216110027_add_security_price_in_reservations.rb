class AddSecurityPriceInReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :security_price, :decimal, :precision => 20, :scale => 10, default: 0
  end
end
