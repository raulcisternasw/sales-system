require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { amount: @order.amount, authorization_code: @order.authorization_code, authorization_date: @order.authorization_date, balance: @order.balance, buy_order: @order.buy_order, card_number: @order.card_number, installments_amount: @order.installments_amount, installments_number: @order.installments_number, nullified_amount: @order.nullified_amount, payment_type_code: @order.payment_type_code, status: @order.status, subscription_id: @order.subscription_id, token: @order.token, transaction_date: @order.transaction_date, user_id: @order.user_id } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { amount: @order.amount, authorization_code: @order.authorization_code, authorization_date: @order.authorization_date, balance: @order.balance, buy_order: @order.buy_order, card_number: @order.card_number, installments_amount: @order.installments_amount, installments_number: @order.installments_number, nullified_amount: @order.nullified_amount, payment_type_code: @order.payment_type_code, status: @order.status, subscription_id: @order.subscription_id, token: @order.token, transaction_date: @order.transaction_date, user_id: @order.user_id } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
