FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon-precomposed.png'), filename: 'apple-touch-icon-precomposed.png')
    end

    item                     {'tエす都'}
    item_comment             {'tエす都'}
    item_category_id         {2}
    item_situation_id        {2}
    delivery_money_id        {2}
    send_region_id           {2}
    send_day_id { 2 }
    price                    {2000}


  end
end
