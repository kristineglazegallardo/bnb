class CreateGuestReservation
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def perform
    payload_format = params[:reservation].present? ? PayloadFormatter.new(params[:reservation]).payload_format1 : PayloadFormatter.new(params[:reservation]).payload_format1
    return Reservation.create(payload_format) ? { success: true } : { success: false }
  end
end
