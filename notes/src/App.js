import React, { Component } from 'react';
import { Router, Route, Switch } from 'react-router'
import './App.css';
import Login from './components/login';




class App extends Component {
  render() {
    return (
      <div className="App">
        <span class="H1 notehead">Notes</span>

          <Login/>

      </div>
    );
  }
}

export default App;
