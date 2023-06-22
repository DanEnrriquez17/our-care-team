import { Controller } from "@hotwired/stimulus"
import Choices from 'choices.js';

// require "json"
// require "open-uri"

// url = "https://rxnav.nlm.nih.gov/REST/displaynames.json"
// prescription_read = URI.open(url).read
// prescription_json = JSON.parse(prescription_read)
// p prescription_json["displayTermsList"]["term"].first(100)

// <%= form_for @prescription do |f| %>
// <%= f.label :name %>
// <%= f.text_field :name, data: {"prescription-form-target": "name", "action": "keyup->prescription-form#updateSelectOptions"} %>
// <div class="shadow p-3 mb-5 bg-body rounded d-none" data-prescription-form-target="selectOptions">
// </div>



// Connects to data-controller="prescription-form"
export default class extends Controller {

  static targets = [ "name", "selectOptions" ]

  connect() {
  }

  updateSelectOptions() {
    fetch("https://rxnav.nlm.nih.gov/REST/displaynames.json")
      .then(response => response.json())
      .then((data) => {
        // Get the cuyrrennt value
        let currentValue = this.nameTarget.value;
        // search the first 5 results that match the current value
        let results = data.displayTermsList.term.filter((term) => {
          return term.includes(currentValue);
        }).slice(0, 5);
        // update the select options with the results
        this.selectOptionsTarget.innerHTML = "";
        this.selectOptionsTarget.classList.remove("d-none");
        results.forEach((result) => {
          this.selectOptionsTarget.insertAdjacentHTML("beforeend", `<option value="${result}" class="prescription-option text-nowrap text-truncate" data-action="click->prescription-form#updateInputValue">${result}</option>`);
        });
      });
      // TODOS:
      // STYLE THE SELECT OPTIONS
      // MAKE THEM CLICKABLE AND UPDATE THE INPUT VALUE
    }

    updateInputValue(event) {
      this.nameTarget.value = event.currentTarget.value;
      this.selectOptionsTarget.classList.add("d-none");
    }
}
