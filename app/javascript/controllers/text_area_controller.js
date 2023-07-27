import { Controller } from "@hotwired/stimulus"
import "easymde"

export default class extends Controller {
  // static targets = [ "mobileMenu", "desktopMenu", "buttonContainer", "closeButton" ]

  connect() {
    console.log('easymde Textarea controller connected')

    var simplemde = new EasyMDE({
      hideIcons: ["image"],
      placeholder: "Ingresa aquí tu texto",
      maxHeight: "300px"
    })
  }
}
