$(document).on('change', '#order_subscription_id', (event) => {
  const subscription_id = parseInt(event.target.value)
  if (isNaN(subscription_id) || subscription_id === null || subscription_id == '') {
    set_empty_field('#order_amount')
  } else {
    const subscription = get_subscription(subscription_id)
    subscription.then((data) => set_subscription_amount(data.total_amount));
  }
})

let get_subscription = async (id) => {
  try {
    const response = await $.ajax({
      url: `/subscriptions/${ id }`,
      type: 'GET',
      dataType: 'json'
    })
    return response
  } catch (error) {
    console.error(error)
  }
}

let set_empty_field = (field) => {
  $(field).attr('value', '')
}

let set_subscription_amount = (amount) => {
  $('#order_amount').attr('value', parseInt(amount))
}
