class CreateGuestReservation
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def perform    
    payload_format = params[:reservation].present? ? PayloadFormatter.new(params[:reservation]).payload_format1 : PayloadFormatter.new(params).payload_format2
    
    return { success: false, message: "Invalid Start and End date." } unless payload_format[:start_date] <= payload_format[:end_date]
    return { success: false, message: "Duplicate reservation dates." } unless ValidateReservationDates.new(payload_format[:guest_id], payload_format[:start_date], payload_format[:end_date]).valid?

    reservation =  Reservation.create(payload_format) 

    guest = reservation.guest
    guest_info = { id: guest.id, email: guest.email, first_name: guest.first_name, last_name: guest.last_name, phone_numbers: guest.phone_numbers }
    reservation.present? ? { success: true, message: "Reservation has been successfully created.", reservation_details: payload_format.merge!(reservation_id: reservation.id, guest_info: guest_info) } : { success: false, message: "Unable to create or save reservation."}
  end
end
