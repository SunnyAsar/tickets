require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      name: "MyString",
      user: nil,
      description: "MyText",
      status: 1,
      costing: 1,
      price: "9.99",
      duration: 1,
      address: "MyText"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[name]"

      assert_select "input[name=?]", "event[user_id]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[status]"

      assert_select "input[name=?]", "event[costing]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[duration]"

      assert_select "textarea[name=?]", "event[address]"
    end
  end
end
