import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'output'];

  hello(e) {
    this.outputTarget.textContent = this.inputTarget.value;
  }
}
