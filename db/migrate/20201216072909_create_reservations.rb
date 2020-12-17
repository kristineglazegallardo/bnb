class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :guest, index: true
      t.datetime :start_date, null: false
    	t.datetime :end_date, null: false
      t.decimal  :expected_payout_amount, :precision => 20, :scale => 10
      t.text     :guest_details
      t.decimal  :expected_payout_amount, :precision => 20, :scale => 10
      t.string   :host_currency
      t.integer  :nights, default: 0, null: false
      t.integer  :number_of_guests, default: 1, null: false
      t.string   :status_type
      t.decimal  :total_paid_amount_accurate, :precision => 20, :scale => 10

      t.timestamps null: false
    end
  end
end
