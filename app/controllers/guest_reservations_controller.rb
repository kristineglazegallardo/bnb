class GuestReservationsController <  ActionController::Base
  def create
    result = CreateGuestReservation.new(params).perform

    if result[:success]
      render json: result, status: 200
    
    else
      render json: result, status: 400
    end
  end
end
