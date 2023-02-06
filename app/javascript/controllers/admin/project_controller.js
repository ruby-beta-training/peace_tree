import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ['select', 'input', 'listData'];

  setUrlDelete(event) {
    const element = event.currentTarget;
    const { url } = element.dataset;
    const el = document.querySelector('#buttonDelete');
    el.href = url;
  }

  showTableInPopUp() {
    const project_id = this.inputTarget.dataset.id;

    const baseUrl = '/admin/projects/';
    Rails.ajax({
      url: `${baseUrl}${project_id}/show_employees`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listDataTarget.innerHTML = res.html;
      },
    });
  }
}
