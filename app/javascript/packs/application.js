// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('bootstrap')

$(document).on('click', 'form .add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).closest('.dynamic-data').find($(this).data('response')).append($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

$(document).on('click', 'form .remove_fields', function(event) {
  $(this).prev('.destroy_elem').val('true');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});
