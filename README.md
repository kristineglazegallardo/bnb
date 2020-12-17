# README
## Sample project for creating BNB reservations for new guest or existing guests.
### To setup local DB:
```
rails db:create
rails db:migrate
```
### API Endpoints
#### For creating guest reservations:
```
http://localhost:3000/guest_reservations
```

#### Sample Request Parameters
Two sample formats accepted for creating guest reservation:
```
{
  "reservation": {
    "start_date": "2020-03-12",
    "end_date": "2020-03-16",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "4 guests",
      "number_of_adults": 2,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "glaze.gallardo@gmail.com",
    "guest_first_name": "Glaze",
    "guest_id": 4,
    "guest_last_name": "Gallardo",
    "guest_phone_numbers": [
      "639999999999",
      "631234555456"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4500.00"
  }
}
```

and

```
{
  "start_date": "2020-03-12",
  "end_date": "2020-03-16",
  "nights": 4,
  "guests": 4,
  "adults": 2,
  "children": 2,
  "infants": 0,
  "status": "accepted",
  "guest": {
  "first_name": "Glaze",
  "last_name": "Gallardo",
  "phone": "639041234123",
  "email": "glaze.gallardo@gmail.com"
  },
  "currency": "PHP",
  "payout_price": "3700.00",
  "security_price": "500",
  "total_price": "4400.00"
}
```
#### Sample Guest Reservation Response
```
{
    "success": true,
    "message": "Successfully created the reservation.",
    "reservation_id": 13,
    "guest_id": 4
}
```
