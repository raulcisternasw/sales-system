require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Amount", with: @order.amount
    fill_in "Authorization code", with: @order.authorization_code
    fill_in "Authorization date", with: @order.authorization_date
    fill_in "Balance", with: @order.balance
    fill_in "Buy order", with: @order.buy_order
    fill_in "Card number", with: @order.card_number
    fill_in "Installments amount", with: @order.installments_amount
    fill_in "Installments number", with: @order.installments_number
    fill_in "Nullified amount", with: @order.nullified_amount
    fill_in "Payment type code", with: @order.payment_type_code
    fill_in "Status", with: @order.status
    fill_in "Subscription", with: @order.subscription_id
    fill_in "Token", with: @order.token
    fill_in "Transaction date", with: @order.transaction_date
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @order.amount
    fill_in "Authorization code", with: @order.authorization_code
    fill_in "Authorization date", with: @order.authorization_date
    fill_in "Balance", with: @order.balance
    fill_in "Buy order", with: @order.buy_order
    fill_in "Card number", with: @order.card_number
    fill_in "Installments amount", with: @order.installments_amount
    fill_in "Installments number", with: @order.installments_number
    fill_in "Nullified amount", with: @order.nullified_amount
    fill_in "Payment type code", with: @order.payment_type_code
    fill_in "Status", with: @order.status
    fill_in "Subscription", with: @order.subscription_id
    fill_in "Token", with: @order.token
    fill_in "Transaction date", with: @order.transaction_date
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
