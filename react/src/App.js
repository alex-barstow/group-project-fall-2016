import React from 'react';
import CheeseList from './CheeseList'

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      cheeses: []
    };
    this.getCheeses = this.getCheeses.bind(this);
    this.timedRefresh = this.timedRefresh.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
  }

  handleSearch() {
    let app = this;
    let searchButton = $('#search-submit');
    searchButton.click(function(event) {
      event.preventDefault();
      let searchBar = $('#search');
      let searchString = searchBar.val();

      $.ajax({
        method: 'GET',
        url: '/cheeses.json',
        contentType: 'application/json'
      })
      .done(data => {
        let searchCheeses = data.cheeses.filter(cheese =>
          cheese.name.includes(searchString)
        );

        app.stopInterval = clearInterval(app.refreshPage);

        if (searchString === '') {
          app.timedRefresh();
        }

        app.setState({ cheeses: searchCheeses });
      });
    });
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
    this.handleSearch();
  }

  render() {
    return(
      <CheeseList data={this.state.cheeses}/>
    )
  };
}

export default App;
