import { Controller } from "@hotwired/stimulus"



// Connects to data-controller="multi-mapbox"
export default class extends Controller {
  static values = {
    apiKey: String
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
  }

  setDoctorMap(element) {
    this.coordinates = element.target.getAttribute('coordinates')
    this.markersValue = this.trasnformCoordinatesStringToArray(this.coordinates)
    this.doctorId = element.target.getAttribute('doctor')

    this.map = new mapboxgl.Map({
      container: document.getElementById(`map-${this.doctorId}`),
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  trasnformCoordinatesStringToArray(coordinatesString) {
    const coordinatesArray = []
    const coordinates = JSON.parse(coordinatesString)
    coordinates.forEach((coordinate) => {
      coordinatesArray.push({lat: coordinate.lat, lng: coordinate.lng})
    })
    return coordinatesArray
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
