FactoryBot.define do
  factory :order_address do
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    city            { '渋谷区' }
    house_number    { '1-2-3' }
    building_name        { 'メゾン101' }
    phone_number    { '09012345678' }
  end
end