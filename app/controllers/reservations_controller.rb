class ReservationsController <  ActionController::Base
  def create
    result = CreateGuestReservation.new(params).perform
    
    if result[:success]
      render json: { success: true, message: "Successfully created the reservation." }, status: 200
    
    else
      render json: { success: false, message: "Unable to save or create the reservation." }, status: 400
    end
  end
end