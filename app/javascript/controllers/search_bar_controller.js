import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("connected with search bar")
  }

  typing(event) {
    this.typed = event.currentTarget.value
    console.log(this.typed)
  };

  submitting(event) {
    event.preventDefault()
    console.log(event.currentTarget)
    console.log(this.typed)
    const url = `${this.formTarget.action}?query=${this.typed}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        data.products.forEach((respo) => {
          const newRespo = `
          <p>${respo}</p>`
          results.innerAdjacentHTML("beforeend", newRespo);
        });
      });
  }
}

// results.innerHTML = "";
// fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${letter}`)
//   .then(response => response.json())
//   .then((data) => {
//     data.words.forEach((respo) => {
//       const newRespo = `
//       <li>${respo}</li>
//       `;
//       results.insertAdjacentHTML("beforeend", newRespo);
//     });
//   });
