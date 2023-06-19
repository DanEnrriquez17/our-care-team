import { Controller } from "@hotwired/stimulus";
import { TabulatorFull as Tabulator } from "tabulator-tables";

let tabledata = [];

const sampleData = [
  { id: 1, name: "Oli Bob", age: "12", col: "red", dob: "" },
  { id: 2, name: "Mary May", age: "1", col: "blue", dob: "14/05/1982" },
  {
    id: 3,
    name: "Christine Lobowski",
    age: "42",
    col: "green",
    dob: "22/05/1982",
  },
  {
    id: 4,
    name: "Brendon Philips",
    age: "125",
    col: "orange",
    dob: "01/08/1980",
  },
  {
    id: 5,
    name: "Margret Marmajuke",
    age: "16",
    col: "yellow",
    dob: "31/01/1999",
  },
];

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
      layout: "fitData", //fit columns to width of table (optional)
      columns: [
        // Define Table Columns
        { title: "Name", field: "name", width: 150 },
        { title: "Status", field: "status", hozAlign: "center" },
        { title: "Dosage", field: "dosage", hozAlign: "left" },
        { title: "Frequency", field: "frequency" },
        { title: "Prescribing Doctor", field: "doctor", hozAlign: "center" },
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
