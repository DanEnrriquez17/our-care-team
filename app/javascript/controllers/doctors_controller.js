import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap";

// Connects to data-controller="doctors"
export default class extends Controller {
  static targets = ["doctors"];

  connect() {
    console.log("Hello from stimulus");
  }
  toggleDoctorEdit(event) {
    const id = event.target.dataset.id;
    this.element.querySelector(`#doctor-${id}-info`).classList.toggle("d-none");
    this.element.querySelector(`#doctor-${id}-edit`).classList.toggle("d-none");

    console.log(id);
  }
}
