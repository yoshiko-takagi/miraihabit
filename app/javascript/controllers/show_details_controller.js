import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-details"
export default class extends Controller {
  static targets = ["details"]

  connect() {
    console.log(this.element)
    console.log(this.detailsTarget)
  }

  select(event) {
    const url = `${event.currentTarget.dataset.challengeId}`
    console.log(url);

    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
        this.detailsTarget.innerHTML = data
      })
  }
}
