import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import '@tabler/core/dist/js/tabler.min';
import '@tabler/core/dist/css/tabler.min.css';
import 'material-icons/iconfont/material-icons.css';

import '@/channels';
import '@/controllers/shared';
import '@/controllers/application';
import '@/styles/application/index.scss';

Rails.start();
Turbolinks.start();
ActiveStorage.start();
require.context('@/images', true);
