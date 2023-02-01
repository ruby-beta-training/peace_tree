import Choices from 'choices.js';
import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

import 'choices.js/public/assets/styles/choices.min.css';

export default class extends Controller {
  static targets = ['select', 'input', 'listData'];

  connect() {}
  selectTargetConnected() {
    const baseUrl = '/admin/employees';
    Rails.ajax({
      url: `${baseUrl}?search=${this.inputTarget.value}&depart=${this.selectTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listDataTarget.innerHTML = res.html;
      },
    });
  }
}
