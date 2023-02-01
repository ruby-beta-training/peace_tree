import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ['input', 'listData'];

  connect() {}

  searchByAttribute() {
    const baseUrl = this.inputTarget.dataset.url;

    Rails.ajax({
      url: `${baseUrl}?search=${this.inputTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listDataTarget.innerHTML = res.html;
      },
    });
  }
}
