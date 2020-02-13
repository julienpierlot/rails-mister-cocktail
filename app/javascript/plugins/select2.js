import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('#ingredients-dropdown').select2({ width: '100%' });
};

export { initSelect2 };
