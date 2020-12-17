class GetGuestID
  def initialize(guest_id, guest_details)
    @guest_id = guest_id
    @guest_details = guest_details
  end

  def perform
    guest = Guest.find_by_id(@guest_id)
    guest.present? ? guest.id : Guest.create(@guest_details).id
  end
end
