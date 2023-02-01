import Choices from 'choices.js';
import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

import 'choices.js/public/assets/styles/choices.min.css';

export default class extends Controller {
  static targets = ['select', 'listData'];

  connect() {}

  searchBySelect() {
    const baseUrl = this.selectTarget.dataset.url;
    // debugger;

    Rails.ajax({
      url: `${baseUrl}?depart=${this.selectTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listDataTarget.innerHTML = res.html;
      },
    });
  }

  selectTargetConnected(currentSelect) {
    // eslint-disable-next-line no-new
    new Choices(currentSelect, {
      removeItemButton: true,
    });
  }
}
