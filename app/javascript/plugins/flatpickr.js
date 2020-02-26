import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/airbnb.css'
// import "flatpickr/dist/flatpickr.min.css";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#start_date", {
  "plugins": [new rangePlugin({ input: "#end_date"})]
});
