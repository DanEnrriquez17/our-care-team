import { Controller } from "@hotwired/stimulus";
import { TabulatorFull as Tabulator } from "tabulator-tables";
import { InteractionModule } from "tabulator-tables";

// Connects to data-controller="tabulator"
export default class extends Controller {
  static targets = { tabledata: Array };

  connect() {
    console.log("*** tabulator controller is connected ***");
    // console.log(this.tabledataValue);
    this.fetchTable();
  }

  createTable(data) {
    // define function call cellCallback =
    const deleteCallback = () => {};
    // table.on("cellClick", cellCallback)
    let table = new Tabulator("#table", {
      responsiveLayout: true,
      height: 405, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: data, // assign data to table
      layout: "fitColumns", //fit columns to width of table (optional)
      columns: [
        //
        // Define Table Columns
        { title: "Name", field: "name", width: 100 },
        { title: "Status", field: "status", hozAlign: "center" },
        { title: "Dosage", field: "dosage", hozAlign: "left" },
        { title: "Frequency", field: "frequency" },
        { title: "Prescribing Doctor", field: "doctor", hozAlign: "center" },
        { title: "Purpose", field: "purpose", hozAlign: "left" },
        {
          title: "Delete",
          formatter: "buttonCross",
          width: 40,
          cellClick: (e, cell) => {
            // alert("cell clicked - " + cell.getValue())
            const row = cell.getRow();
            const rowData = row.getData();
            const recordId = rowData.id;

            // Send a request to delete the record
            fetch(`/prescriptions/${recordId}`, {
              method: "DELETE",
              headers: {
                "Content-Type": "application/json",
                Accept: "application/json",
                // 'Content-Type': 'application/x-www-form-urlencoded',
                "X-CSRF-Token": document.querySelector(
                  'meta[name="csrf-token"]'
                ).content,
              },
            })
              .then(response => {
                console.log(response);
                // Delete the row from the table if the request is successful
                if (response.ok) {
                  row.delete();
                } else {
                  // Handle error response
                  console.error("Failed to delete record");
                }
              })
              .catch(error => {
                // Handle network error
                console.error("Network error", error);
              });
          },
        },
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
