import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput' ]
  connect() {
    flatpickr(this.startDateInputTarget, {
      inline: true,
      mindate: "today",
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }
}