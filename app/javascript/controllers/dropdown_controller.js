import { Controller } from "@hotwired/stimulus"
import { toggle } from 'el-transition'

export default class extends Controller {
  static targets = [ "mobileMenu", "desktopMenu", "buttonContainer", "closeButton" ]
  connect() {
    console.log('Dropdown Menu controller connected')
  }

  toggleDesktopMenu() {
    toggle(this.desktopMenuTarget)
  }

  toggleMobileMenu() {
    console.log('toggle mobile menu')
    toggle(this.mobileMenuTarget)
  }  
}
