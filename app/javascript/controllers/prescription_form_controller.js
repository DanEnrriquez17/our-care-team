import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="prescription-form"
export default class extends Controller {

  static targets = [ "name", "selectOptions" ]

  connect() {
  }

  updateSelectOptions() {
    fetch(`https://api.fda.gov/drug/label.json?search=openfda.brand_name:${this.nameTarget.value}&limit=5`)
      .then(response => response.json())
      .then((data) => {
        let results = data.results.map((result) => {
          return result.openfda.brand_name[0];
        });
        this.selectOptionsTarget.innerHTML = "";
        this.selectOptionsTarget.classList.remove("d-none");
        let animation_count = 1;
        results.forEach((result) => {
          this.selectOptionsTarget.insertAdjacentHTML("beforeend", `<option value="${result}" class="prescription-option text-nowrap text-truncate item-animate-${animation_count}" data-action="click->prescription-form#updateInputValue">${result}</option>`);
          animation_count += 1;
        });
        if (this.nameTarget.value === "") {
          console.log("empty");
          this.selectOptionsTarget.classList.add("d-none");
        }
      });
    }

    updateInputValue(event) {
      this.nameTarget.value = event.currentTarget.value;
      this.selectOptionsTarget.classList.add("d-none");
    }
}
