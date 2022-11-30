import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-list"
export default class extends Controller {
  static targets = ["form", "list", "hide", "button"]


  reveal(event) {
    hideTarget
  }

  send(event){
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.insertAdjacentHTML("beforeend", data)
      })

  };
}
