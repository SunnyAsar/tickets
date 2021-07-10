FactoryBot.define do
  factory :event do
    name { "Event 1" }
    user { create :user }

description { "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Illo dolores, nisi ea amet omnis eligendi modi culpa maiores? Provident sequi asperiores delectus assumenda placeat in doloremque aut iure itaque enim." }
    status { :unpublished }
    costing { :free }
    price { "9.99" }
    duration { 1 }
    address { "Space x campus" }
  end
end
