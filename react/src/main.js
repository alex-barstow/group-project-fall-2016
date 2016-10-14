import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';

$(function() {
  console.log("I'm react!")
  if($('#app').length) {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  }
});
