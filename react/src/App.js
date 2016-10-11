import React from 'react';
import CheeseList from './CheeseList'

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      cheeses: []
    };
    this.getCheeses = this.getCheeses.bind(this)
    this.timedRefresh = this.timedRefresh.bind(this)
  }
  getCheeses() {
    $.ajax({
      method: 'GET',
      url: '/cheeses.json',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ cheeses: data.cheeses })
    });
  };

  timedRefresh() {
    this.refreshPage = setInterval(this.getCheeses, 5000);
  };

  componentDidMount() {
    this.getCheeses();
    this.timedRefresh();
  }
  render() {
    return(
      <CheeseList data={this.state.cheeses}/>
    )
  };
}

export default App;
