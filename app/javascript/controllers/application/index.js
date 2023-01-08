import { Application } from '@hotwired/stimulus';
import { definitionsFromContext } from '@hotwired/stimulus-webpack-helpers';

var application = Application.start();
var context = require.context('./', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
