import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = [
    'select',
    'input',
    'listData',
    'listProject',
    'search',
    'inputUser',
    'input1',
  ];

  setUrlDelete(event) {
    const element = event.currentTarget;
    const { url } = element.dataset;
    const el = document.querySelector('#buttonDelete');
    el.href = url;
  }

  showEmployee() {
    debugger;
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
        listData.innerHTML = res.html;
        paginationEl.innerHTML = res.pagination;
        const paginationItems = paginationEl.querySelectorAll(`.page-item`);
        const k = document.querySelectorAll(`#plus`);
        k.forEach((item) => {
          item.setAttribute(`data-action`, `click->project#hello`);
          item.setAttribute(`data-url`, '/admin/projects/510/add_employee');
        });
        paginationItems.forEach((item) => {
          item.setAttribute(
            `data-action`,
            `click->project#getEmployeeTableWithPage`,
          );
          item.setAttribute(
            `data-url`,
            item.querySelector(`a`).getAttribute(`href`),
          );
        });
      },
    });
  }

  hello(event) {
    const userId = this.inputUserTarget.dataset.userid;
    const project_id = this.inputUserTarget.dataset.projectid;
    debugger;
    Rails.ajax({
      url: `/admin/projects/${project_id}/add_employee?user_id=${userId}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        const modalListEmployeesEl =
          document.getElementById('modalListEmployees');
        const listData = document.getElementById('listData');
        listData.innerHTML = res.html;
        const paginationEl = modalListEmployeesEl.querySelector('#pagination');
        paginationEl.innerHTML = res.pagination;
        const paginationItems = paginationEl.querySelectorAll(`.page-item`);
        const k = modalListEmployeesEl.querySelectorAll(`#plus`);
        k.forEach((item) => {
          item.setAttribute(`data-action`, `click->project#hello`);
        });
        paginationItems.forEach((item) => {
          item.setAttribute(
            `data-action`,
            `click->project#getEmployeeTableWithPage`,
          );
          item.setAttribute(
            `data-url`,
            item.querySelector(`a`).getAttribute(`href`),
          );
        });
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
        listData.innerHTML = res.html;
        const modalListEmployeesEl =
          document.getElementById('modalListEmployees');
        const paginationEl = modalListEmployeesEl.querySelector('#pagination');
        paginationEl.innerHTML = res.pagination;
        const paginationItems = paginationEl.querySelectorAll(`.page-item`);
        debugger;

        paginationItems.forEach((item) => {
          item.setAttribute(
            `data-action`,
            `click->project#getEmployeeTableWithPage`,
          );
          item.setAttribute(
            `data-url`,
            item.querySelector(`a`).getAttribute(`href`),
          );
        });
      },
    });
  }

  searchByAttribute() {
    const baseUrl = this.inputTarget.dataset.url;
    debugger;
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
