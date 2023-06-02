FactoryBot.define do
  factory :delivery_order do
    post_code        { '123-4567' }
    send_region_id   {2}
    tel              { '12345678910' }
    municipality     { '熊本市' }
    address          { '1-1-1' }
    building_name     { '熊本アパート' }
    token {"pk_test_dfeb91d4f4ab641a62901072"}
  end
end
