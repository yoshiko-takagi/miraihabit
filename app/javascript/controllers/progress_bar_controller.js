import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["score", "stepper"];

  connect() {
    // define controller in html
    // define targets (score, steppers)
    // read score from score-target
    console.log(this.scoreTarget);
    console.log(this.stepperTargets);

    this.stepperTargets.forEach((stepper) => {
      console.log(stepper.dataset.score)
      // store this score as a number in var
      const score = stepper.dataset.score
      // if the stepper_score is smaller than scoreTarget content (converted to number)
      // if score < this.scoreTarget.to_i
      // add the class as completed to the stepper
        // score.element.classList.add("stepper-item completed")

    })
    // based on score, it calculate in which stage you are
    // iterate over steppers & add class completed up to the stage you are
  }
}
