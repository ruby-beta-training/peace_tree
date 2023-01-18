import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  setUrlDelete(event) {
    const element = event.currentTarget;
    const { url } = element.dataset;
    const el = document.querySelector('#buttonDelete');
    el.href = url;
  }
}
