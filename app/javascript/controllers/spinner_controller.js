import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spinner"
export default class extends Controller {

  static targets = [ "spinner", "button" ]

  showSpinner() {
    this.spinnerTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none")
  }
}
