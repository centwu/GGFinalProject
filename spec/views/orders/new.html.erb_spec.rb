require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      email: "MyString",
      status: 1,
      total: 1.5
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[email]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[total]"
    end
  end
end
