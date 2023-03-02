import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  connect() {
    // define controller in html
    // define targets (score, steppers)
    // read score from score-target
    // based on score, it calculate in which stage you are
    // iterate ofer steppers & add class completed up to the stage you are
  }
}
