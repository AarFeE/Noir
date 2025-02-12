// app/javascript/controllers/header_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["header"];

  connect() {
    this.lastScrollTop = 0;
    this.headerHeight = this.headerTarget.offsetHeight; // Get the header's height
    window.addEventListener("scroll", this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll.bind(this));
  }

  handleScroll() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    if (scrollTop > this.headerHeight && scrollTop > this.lastScrollTop) {
      // Scrolling down past the header's height
      this.headerTarget.classList.add("hide-header");
    } else {
      // Scrolling up or within the header's height
      this.headerTarget.classList.remove("hide-header");
    }

    this.lastScrollTop = scrollTop;
  }
}