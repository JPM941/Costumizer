import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput' ]
  // connect() {
  //   flatpickr(this.startDateInputTarget, {
  //     inline: true,
  //     mindate: "today",
  //     mode: 'range',
  //     "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
  //   })
  // }


// disable flatpickr


  static values = { dates: Object }

  connect() {
    this.#initFlatPickr()
    console.log("controller flatpickr connecté")
  }

  #initFlatPickr() {
    flatpickr(this.startDateInputTarget, this.#options());
  }
  #options() {
    return {
      ...this.#parsedBookedDates(),
      enableTime: true,
      minDate: new Date(),
      inline: true,
      mindate: "today",
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    }
  }

  #parsedBookedDates() {
    return this.datesValue
  }
}
