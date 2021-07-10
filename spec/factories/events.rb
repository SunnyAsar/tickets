FactoryBot.define do
  factory :event do
    name { "Event 1" }
    user { create :user }
    description { "My event" }
    status { :unpublished }
    costing { :free }
    price { "9.99" }
    duration { 1 }
    address { "Space x campus" }
  end
end
