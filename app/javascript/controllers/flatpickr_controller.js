import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder' ]
  static values = { dates: Object, price: Number }

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
      // enableTime: true,
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

  updatePrice() {
    const startDate = this.startDateInputTarget.value
    const endDate = this.endDateInputTarget.value
    const days = this.#diffInDays(startDate, endDate)
    const totalValue = this.#totalValue(days)
    this.#setPriceValue(totalValue)
  }

    #setPriceValue(value) {
      this.priceHolderTarget.innerText = value
    }

    #diffInDays(startDate, endDate) {
      if (startDate && endDate) {
        const diffTime = (Date.parse(endDate) - Date.parse(startDate))
        var days = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
      } else {
        var days = 0
        }
      return days + 1
    }

    #totalValue(days) {
      return (days) * this.priceValue
    }
}
