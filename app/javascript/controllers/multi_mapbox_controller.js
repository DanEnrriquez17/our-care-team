import { Controller } from "@hotwired/stimulus"



// Connects to data-controller="multi-mapbox"
export default class extends Controller {
  static values = {
    address: Array,
    apiKey: String
  };
  static targets = ["map", "key"];

  connect() {
    console.log(this.apiKeyValue)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
  }
}
