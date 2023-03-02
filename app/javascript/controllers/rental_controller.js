import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rental"
export default class extends Controller {
  static targets = ["startDate", "endDate"]
  connect() {
    console.log("connect");
    console.log(this.StartDateTarget)
    console.log(this.EndDateTarget)
  }
  calculateSum() {
    console.log('hello from calculate sum')
  }
}
