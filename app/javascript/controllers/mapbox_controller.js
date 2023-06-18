import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
const token = MAPBOX_TOKEN;

// Connects to data-controller="mapbox"
export default class extends Controller {
  static targets = ["map", "address"];

  connect() {
    console.log("*** mapbox stimulus controller is now loaded ***");
    this.getCoordinates(this.addressTarget.innerHTML);
  }

  getCoordinates() {
    console.log("getCoordinates method was called");
    console.log(token);

    fetch(
      `https://api.mapbox.com/geocoding/v5/mapbox.places/${this.addressTarget.innerHTML}.json?access_token=${token}`
    )
      .then(response => response.json())
      .then(data => {
        console.log(data.features[0].center[0]);
        console.log(data.features[0].center[1]);
        this.renderMap(data.features[0].center[0], data.features[0].center[1]);
      });
  }

  renderMap(long, lat) {
    console.log("renderMap called");
    mapboxgl.accessToken = token;
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
