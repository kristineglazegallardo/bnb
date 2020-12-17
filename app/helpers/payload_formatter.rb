class PayloadFormatter
  attr_reader :payload
 
  def initialize(payload)
    @payload = payload
  end

  def payload_format1
    guest_details = { 
      email: payload[:guest_email],
      first_name: payload[:guest_first_name],
      last_name: payload[:guest_last_name],
      phone_numbers: payload[:guest_phone_numbers],
    }

    guest_id = GetGuestID.new(payload[:guest_id], guest_details).perform
    
    {
      start_date: payload[:start_date],
      end_date:  payload[:end_date],
      expected_payout_amount: payload[:expected_payout_amount],
      guest_details: {
        localized_description: payload[:guest_details][:localized_description],
        number_of_adults: payload[:guest_details][:number_of_adults],
        number_of_children: payload[:guest_details][:number_of_children],
        number_of_infants: payload[:guest_details][:number_of_infants],
      },
      security_price: payload[:listing_security_price_accurate],
      host_currency: payload[:host_currency],
      nights: payload[:nights],
      number_of_guests: payload[:number_of_guests],
      status_type: payload[:status_type],
      total_paid_amount_accurate: payload[:total_paid_amount_accurate],
      guest_id: guest_id
    }
  end

  def payload_format2
    guest_details = { 
      email: payload[:guest][:email],
      first_name: payload[:guest][:first_name],
      last_name: payload[:guest][:last_name],
      phone_numbers: payload[:phone]
    }

    guest_id = GetGuestID.new(payload[:guest][:id], guest_details).perform

    {
      start_date: payload[:start_date],
      end_date:  payload[:end_date],
      expected_payout_amount: payload[:payout_price],
      guest_details: {
        localized_description: "#{payload[:number_of_guests]} guests.",
        number_of_adults: payload[:adults],
        number_of_children: payload[:children],
        number_of_infants: payload[:infants],
      },
      security_price: payload[:security_price],
      host_currency: payload[:currency],
      nights: payload[:nights],
      number_of_guests: payload[:guests],
      status_type: payload[:status],
      total_paid_amount_accurate: payload[:total_price],
      guest_id: guest_id
    }
  end
end
