import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
export default class extends Controller {
  static targets = ["map", "address", "key"];

  connect() {
    // console.log("*** mapbox stimulus controller is now loaded ***");
    this.getCoordinates(this.addressTarget.innerHTML);
    // console.log(this.keyTarget.dataset.key);
    // console.log("console test after key");
  }

  getCoordinates() {
    // console.log("getCoordinates() was called");

    fetch(
      `https://api.mapbox.com/geocoding/v5/mapbox.places/${this.addressTarget.innerHTML}.json?access_token=${this.keyTarget.dataset.key}`
    )
      .then(response => response.json())
      .then(data => {
        // console.log(data.features[0].center[0]);
        // console.log(data.features[0].center[1]);
        this.renderMap(data.features[0].center[0], data.features[0].center[1]);
      });
  }

  renderMap(long, lat) {
    // console.log("renderMap() called");
    mapboxgl.accessToken = this.keyTarget.dataset.key;
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v12",
      center: [long, lat],
      zoom: 12,
    });
    new mapboxgl.Marker().setLngLat([long, lat]).addTo(map);
    // this.mapTarget.innerHTML = map;
  }

  // load(event) {
  //   event.preventDefault();
  //   console.log("load method called");
  //   console.log(this.addressTarget.value);
  //   // this.coordinatesTarget.innerText = "";
  //   this.getCoordinates(this.addressTarget.value);
  // }
}



import { Controller } from "@hotwired/stimulus"



// Connects to data-controller="multi-mapbox"
export default class extends Controller {
  static values = {
    address: Array,
    apiKey: String
  };
  static targets = ["map", "key"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    this.addressValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.addressValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
