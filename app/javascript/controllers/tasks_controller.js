import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap"; // Import bootstrap's Modal component

export default class extends Controller {
  static targets = ["tasks"];

  // Declare the properties for typewriter
  i = 0;
  txt =
    "Hello, Lowell. Please remember to check your assigned tasks."; /* The text */
  speed = 50; /* The speed/duration of the effect in milliseconds */

  connect() {
    console.log("hola Isaac");
    // Call the typeWriter function on connect
    this.typeWriter();
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
        //console.log("holaaa");
        //myModal.show();
      });
  }

  toggleTaskEdit(event) {
    const id = event.target.dataset.id;
    this.element.querySelector(`#task-${id}-info`).classList.toggle("d-none");
    this.element.querySelector(`#task-${id}-edit`).classList.toggle("d-none");

    console.log(id);
  }

  typeWriter() {
    if (this.i < this.txt.length) {
      document.getElementById("demo").innerHTML += this.txt.charAt(this.i);
      this.i++;
      setTimeout(() => this.typeWriter(), this.speed);
    }
  }
}
