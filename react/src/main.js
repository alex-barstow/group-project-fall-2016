import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

$(function() {
  console.log("I'm react!")
  if($('#app').length) {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  }
});
