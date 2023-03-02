import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"]

  updateNavbar() {
    if (window.scrollY >= 1) {
      this.element.classList.add("navbar-lewagon-zeblue")
    } else {
      this.element.classList.remove("navbar-lewagon-zeblue")
    }
  }
}
