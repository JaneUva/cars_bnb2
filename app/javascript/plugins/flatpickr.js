import flatpickr from "flatpickr"
import 'flatpickr/dist/themes/airbnb.css'
//import "flatpickr/dist/flatpickr.min.css";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#start_date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end_date"})]
});

const startDateInput = document.getElementById('booking_start_date');
const endDateInput = document.getElementById('booking_end_date');

// Check that the query selector id matches the one you put around your form.
if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#booking_date_picker').dataset.unavailable)
endDateInput.disabled = true

flatpickr(startDateInput, {
  minDate: "today",
  disable: unavailableDates,
  dateFormat: "Y-m-d",
});

console.log('im in the file')

startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: unavailableDates,
    dateFormat: "Y-m-d"
    });
  })
};
