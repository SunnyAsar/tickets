require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        name: "Name",
        user: nil,
        description: "MyText",
        status: 2,
        costing: 3,
        price: "9.99",
        duration: 4,
        address: "MyText"
      ),
      Event.create!(
        name: "Name",
        user: nil,
        description: "MyText",
        status: 2,
        costing: 3,
        price: "9.99",
        duration: 4,
        address: "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
