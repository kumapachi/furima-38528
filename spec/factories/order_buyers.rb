FactoryBot.define do
  factory :order_buyer do
    user_id       { Faker::Number.non_zero_digit }
    item_id       { Faker::Number.non_zero_digit }
    postal_code   { Faker::Number.numerify('###-####') }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_address }
    building      { Faker::Address.secondary_address }
    phone_number  { Faker::Number.decimal_part(digits: 11) }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
