import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets = ["score", "stepper"];

  connect() {
    // define controller in html
    // define targets (score, steppers)
    // read score from score-target
    // console.log(this.scoreTarget);
    // console.log(this.stepperTargets);

    const score = parseInt(this.scoreTarget.innerText, 10)
    // if the stepper_score is smaller than scoreTarget content (converted to number)
    this.stepperTargets.forEach((stepper) => {
      // store this score as a number in var
      const stepp = parseInt(stepper.dataset.score, 10)
      // console.log(stepp)
      // console.log(score)
      if (stepp <= score) {
        stepper.classList.add("completed")
      }
      // add the class as completed to the stepper

    })
    // based on score, it calculate in which stage you are
    // iterate over steppers & add class completed up to the stage you are
  }
}
