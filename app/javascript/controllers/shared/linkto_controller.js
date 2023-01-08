import Turbolinks from 'turbolinks';
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  navigate(event) {
    var mainTarget = event.currentTarget;
    var navigatePath = mainTarget.dataset?.href;
    var stopNavigateTarget = event.target.closest('.stop-navigate');

    if ((!stopNavigateTarget || !mainTarget.contains(stopNavigateTarget)) && navigatePath) {
      Turbolinks.visit(navigatePath);
    }
  }
}
