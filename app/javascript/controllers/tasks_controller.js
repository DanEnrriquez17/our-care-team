import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap"; // Import bootstrap's Modal component

export default class extends Controller {
  static targets = ["tasks"];

  connect() {
    console.log("hola Isaac");
  }

  // Rest of your functions (myTasks, pendingTasks, completedTasks)

  loadForm(event) {
    event.preventDefault();

    fetch(event.target.href, {
      headers: {
        Accept: "text/html",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((html) => {
        document.querySelector("#task-form-container").innerHTML = html;

        // Initialize and show the bootstrap modal
        var myModal = new Modal(document.getElementById("staticBackdrop"), {});
        myModal.show();
      });
  }
}
