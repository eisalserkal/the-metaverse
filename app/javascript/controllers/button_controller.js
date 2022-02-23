import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello from button_controller!")
  }

  updateButton(event) {
    this.element.value = 'Booking submitted!'
    this.element.style.backgroundColor = 'green'
    this.element.disabled = true
  }
}
