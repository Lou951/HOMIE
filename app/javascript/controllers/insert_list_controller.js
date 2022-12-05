import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-list"
export default class extends Controller {
  static targets = ["form", "list", "hide"]


  reveal() {
    this.hideTarget.classList.remove("hidden")
  }

  send(event){
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        console.log(data.inserted_item)
        this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
      })
    this.formTarget.reset()
    this.hideTarget.classList.add("hidden")
  };
}

// .then((data) => {
//       if (data.inserted_item) {
//         this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
//       }
//       this.formTarget.outerHTML = data.form
//     })
// }
