import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

$(function() {
  if($('#app').length) {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  }
});
