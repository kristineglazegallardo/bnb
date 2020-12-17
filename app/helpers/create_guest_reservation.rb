class CreateGuestReservation
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def perform
    payload_format = params[:reservation].present? ? PayloadFormatter.new(params[:reservation]).payload_format1 : PayloadFormatter.new(params).payload_format2

    reservation =  Reservation.create(payload_format) 
    reservation.present? ? { success: true, message: "Reservation has been successfully created.", reservation_id: reservation.id, guest_id: reservation.guest.id } : { success: false, message: "Unable to create or save reservation."}
  end
end
