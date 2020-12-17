class ValidateReservationDates
  def initialize(guest_id, start_date, end_date)
    @guest_id = guest_id
    @start_date = start_date
    @end_date = end_date

  end

  def valid?
    reservations = Reservation.where(guest_id: @guest_id, start_date: @start_date, end_date: @end_date) 
    return true unless reservations.present?

    validate_overlapping_dates(reservations)
  end

  def validate_overlapping_dates(reservations)
    reservations.each do |reservation| 
      return false if @start_date.between?(reservation.start_date, reservation.end_date)
    end
  end
end
