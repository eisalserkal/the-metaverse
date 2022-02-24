import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bookings", "listings" ]
  connect() {
    console.log("hello from pagination_controller!")
  }

  bookings(event) {
    console.log('bookings')
    event.preventDefault()

    this.listingsTarget.classList.add('d-none')
    if (this.bookingsTarget.classList.contains('d-none')) {
      this.bookingsTarget.classList.remove('d-none')
    }
  }

  listings(event) {
    console.log('listings')
    event.preventDefault()
    this.bookingsTarget.classList.add('d-none')
    if (this.listingsTarget.classList.contains('d-none')) {
      this.listingsTarget.classList.remove('d-none')
    }
  }

}
