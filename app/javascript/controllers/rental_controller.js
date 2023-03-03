import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="rental"
export default class extends Controller {
  static targets = ["startDate", "endDate", "calculatePrice", 'bookButton']
  static values = {
    pricePerDay: Number
  }

  calculateSum() {
    console.log(this.calculatePriceTarget)
    let startDate = new Date(this.startDateTarget.value)
    let endDate = new Date(this.endDateTarget.value)
    let stayTime = Math.round((endDate - startDate) / (1000 * 60 * 60 * 24))
    if ((endDate.toString() != 'Invalid Date') && (startDate.toString() != 'Invalid Date')) {
      if (endDate > startDate) {
        this.calculatePriceTarget.value = `${this.pricePerDayValue * stayTime} - CHF`
        this.bookButtonTarget.disabled = false
      } else {
        this.bookButtonTarget.disabled = true
      }
    }
  }
}
