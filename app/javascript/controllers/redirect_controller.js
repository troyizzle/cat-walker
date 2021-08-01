import { Controller } from "stimulus"

export default class extends Controller {
  static values = { url: String }

  redirect() {
    location.href = this.urlValue;
  }
}
