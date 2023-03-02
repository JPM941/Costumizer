import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star"
export default class extends Controller {

  static targets = ["input", "star"]

  connect() {
    console.log("hello :)")
    console.log(this.inputTarget)
  }

  rate() {

    const rating = event.currentTarget.dataset.rating
    this.starTargets.forEach((star) => {
      if (star.dataset.rating < rating) {
        star.classList.add("active")
      } else {
        star.classList.remove("active")
      }
    })
    event.currentTarget.classList.add("active")
    this.inputTarget.value = rating
  }
}
