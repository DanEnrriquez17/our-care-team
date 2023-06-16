import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["tasks"];

  connect() {
    console.log("hola Isaac");
  }

  myTasks(e) {
    fetch("/tasks?filter=user", {
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((data) => {
        console.log(data);
        this.tasksTarget.innerHTML = data;
      });
  }

  pendingTasks(e) {
    fetch("/tasks?filter=Pending", {
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((data) => {
        console.log(data);
        this.tasksTarget.innerHTML = data;
      });
  }

  completedTasks(e) {
    fetch("/tasks?filter=Completed", {
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
    })
      .then((response) => response.text())
      .then((data) => {
        console.log(data);
        this.tasksTarget.innerHTML = data;
      });
  }
}
