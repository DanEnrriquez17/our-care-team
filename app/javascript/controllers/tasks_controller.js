import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap"; // Import bootstrap's Modal component

export default class extends Controller {
  static targets = ["tasks"];

  connect() {
    console.log("hola Isaac");
  }

  // Rest of your functions (myTasks, pendingTasks, completedTasks)
  myTasks(event) {
    event.preventDefault();
    fetch("/tasks?filter=user", {
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((html) => {
        this.tasksTarget.innerHTML = html;
      });
  }

  pendingTasks(event) {
    event.preventDefault();
    fetch("/tasks?filter=Pending", {
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((html) => {
        this.tasksTarget.innerHTML = html;
      });
  }

  completedTasks(event) {
    event.preventDefault();
    fetch("/tasks?filter=Completed", {
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((html) => {
        this.tasksTarget.innerHTML = html;
      });
  }

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
