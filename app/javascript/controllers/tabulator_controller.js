import { Controller } from "@hotwired/stimulus";
import { TabulatorFull as Tabulator } from "tabulator-tables";

// Connects to data-controller="tabulator"
export default class extends Controller {
  static targets = { tabledata: Array };

  connect() {
    console.log("*** tabulator controller is connected ***");
    // console.log(this.tabledataValue);
    this.fetchTable();
  }

  createTable(data) {
    let table = new Tabulator("#table", {
      height: 405, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: data, // assign data to table
      layout: "fitColumns", //fit columns to width of table (optional)
      columns: [
        // Define Table Columns
        { title: "Name", field: "name", width: 150 },
        { title: "Status", field: "status", hozAlign: "center" },
        { title: "Dosage", field: "dosage", hozAlign: "left" },
        { title: "Frequency", field: "frequency" },
        { title: "Prescribing Doctor", field: "doctor", hozAlign: "center" },
        { title: "Purpose", field: "purpose", hozAlign: "left" },
      ],
    });
  }

  fetchTable() {
    fetch("/patients/json")
      .then(response => response.json())
      .then(data => {
        console.log(data);
        this.createTable(data);
      });
  }
}
