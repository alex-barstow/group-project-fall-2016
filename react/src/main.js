import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';

$(function() {
  let responseData;
  $.ajax({
    method: 'GET',
    url: '/cheeses.json',
    contentType: 'application/json'
  })
  .done(data => {
    return(
      responseData = data
    );
  });
  debugger;

  ReactDOM.render(
    <App data={responseData}/>,
    document.getElementById('app')
  );
});
