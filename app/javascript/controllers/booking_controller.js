import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["description", "path", "option"];

  updateBook(event) {
    this.updateStyling();
    const button = event.target.closest("button");
    button.classList.add("text-green-500", "font-extrabold");
    const { path, description } = button.dataset;
    this.updateDescription(description);
    this.updatePath(path);
  }

  // Used to set all options to default state with no classes
  updateStyling() {
    this.optionTargets.forEach((elem) => elem.classList = '')
  }

  updateDescription(description) {
    if (!this.hasDescriptionTarget) return;

    this.descriptionTarget.innerHTML = description;
  }

  updatePath(path) {
    if (!this.hasPathTarget) return;

    this.pathTarget.href = path;
  }
}
