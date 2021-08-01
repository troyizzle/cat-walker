# frozen_string_literal: true

[
  {
    price: 15.00,
    time: 15,
    appointment_type: 0,
    icon: "cake"
  },
  {
    price: 30.00,
    time: 30,
    appointment_type: 0,
    icon: "cake"
  },
  {
    price: 45.00,
    time: 60,
    appointment_type: 0,
    icon: "cake"
  }
].each do |book|
  Book.find_or_create_by!(book)
end
