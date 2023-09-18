json.extract! passenger, :id, :name, :email, :password, :phone, :address, :credit_card, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
