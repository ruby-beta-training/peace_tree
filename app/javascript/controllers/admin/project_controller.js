import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

function renderWhenSuccess(res) {
  const modalListEmployeesEl = document.getElementById('modalListEmployees');
  const listData = document.getElementById('listData');
  listData.innerHTML = res.html;
  const paginationEl = modalListEmployeesEl.querySelector('#pagination');
  paginationEl.innerHTML = res.pagination;
  const paginationItems = paginationEl.querySelectorAll(`.page-item`);
  const k = modalListEmployeesEl.querySelectorAll(`#plus`);
  k.forEach((item) => {
    item.setAttribute(`data-action`, `click->project#rerenderTableEmployee`);
  });
  paginationItems.forEach((item) => {
    item.setAttribute(`data-action`, `click->project#getEmployeeTableWithPage`);
    item.setAttribute(`data-url`, item.querySelector(`a`).getAttribute(`href`));
  });
}
export default class extends Controller {
  static targets = [
    'select',
    'input',
    'listData',
    'listProject',
    'search',
    'inputUser',
  ];

  setUrlDelete(event) {
    const element = event.currentTarget;
    const { url } = element.dataset;
    const el = document.querySelector('#buttonDelete');
    el.href = url;
  }

  showEmployee() {
    const project_id = this.input1Target.dataset.id;
    const employees = document.getElementById('employees');
    const baseUrl = '/admin/projects/';
    Rails.ajax({
      url: `${baseUrl}${project_id}/show_employees_of_project`,
      type: 'get',
      dataType: 'json',
      data: (res) => {
        employees.innerHTML = res.html;
      },
    });
  }

  showTableInPopUp() {
    const project_id = this.inputTarget.dataset.id;
    const modalListEmployeesEl = document.getElementById('modalListEmployees');
    const paginationEl = modalListEmployeesEl.querySelector('#pagination');
    const listData = document.getElementById('listData');
    const baseUrl = '/admin/projects/';
    Rails.ajax({
      url: `${baseUrl}${project_id}/show_employees?search=${this.searchTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        renderWhenSuccess(res);
      },
    });
  }

  rerenderTableEmployee(event) {
    const userId = this.inputUserTarget.dataset.userid;
    const project_id = this.inputUserTarget.dataset.projectid;
    Rails.ajax({
      url: `/admin/projects/${project_id}/add_employee?user_id=${userId}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        renderWhenSuccess(res);
      },
    });
  }

  getEmployeeTableWithPage(event) {
    const modalListEmployeesEl = document.getElementById('modalListEmployees');
    const paginationEl = modalListEmployeesEl.querySelector('#pagination');
    const listData = document.getElementById('listData');
    Rails.ajax({
      url: event.currentTarget.dataset.url,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        renderWhenSuccess(res);
      },
    });
  }

  searchByAttribute() {
    const baseUrl = this.inputTarget.dataset.url;
    Rails.ajax({
      url: `${baseUrl}?search=${this.inputTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listProjectTarget.innerHTML = res.html;
      },
    });
  }
}
