require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "visiting the index" do
    visit subscriptions_url
    assert_selector "h1", text: "Subscriptions"
  end

  test "creating a Subscription" do
    visit subscriptions_url
    click_on "New Subscription"

    fill_in "Description", with: @subscription.description
    check "Is active" if @subscription.is_active
    fill_in "Name", with: @subscription.name
    fill_in "Total amount", with: @subscription.total_amount
    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "updating a Subscription" do
    visit subscriptions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @subscription.description
    check "Is active" if @subscription.is_active
    fill_in "Name", with: @subscription.name
    fill_in "Total amount", with: @subscription.total_amount
    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription" do
    visit subscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription was successfully destroyed"
  end
end
