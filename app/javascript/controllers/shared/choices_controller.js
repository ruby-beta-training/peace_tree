import Choices from 'choices.js';
import { Controller } from '@hotwired/stimulus';

import 'choices.js/public/assets/styles/choices.min.css';

export default class extends Controller {
  static targets = ['select'];

  selectTargetConnected(currentSelect) {
    // eslint-disable-next-line no-new
    new Choices(currentSelect, {
      removeItemButton: true
    });
  }
}
