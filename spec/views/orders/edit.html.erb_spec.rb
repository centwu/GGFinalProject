require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      email: "MyString",
      status: 1,
      total: 1.5
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[email]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[total]"
    end
  end
end
