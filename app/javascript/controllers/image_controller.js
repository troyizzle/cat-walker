import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["updateImage"];

  updateImage(event) {
    if (!this.hasUpdateImageTarget) { return; }
    this.showImage(event.target, this.updateImageTarget);
  }

  showImage(input, target) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function(e) {
        target.src = e.target.result;
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
}
