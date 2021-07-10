# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include FactoryBot::Syntax::Methods

3.times do |n|
  create(:user, email: "user#{n}@gmail.com") do |user|
    2.times do |i|
      create(:event, name: "Event #{i} showdown", user_id: user.id, status: :published)
    end
  end
end
