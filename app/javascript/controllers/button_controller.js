import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello from buttonm_controller!")
  }

  updateButton(event) {
    event.preventDefault();
    this.element.value = 'Booking submitted!'
    this.element.style.backgroundColor = 'green'
    this.element.disabled = true
  }
}
