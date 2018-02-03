import React, {Component} from 'react';
import './App.css';


import Login from './components/login';
import Notes from './components/Notes';


class App extends Component {
	constructor(props) {
		super(props);
		this.state = {
			term : '',
			isLoggedIn : true
		};
	}

	render() {
		return <FrontDoor isLoggedIn={this.state.isLoggedIn}/>
	}
}

export default App;

function FrontDoor(props) {

	const isLoggedIn = props.isLoggedIn;
	console.log ('is loggged in %s', isLoggedIn);
	if (isLoggedIn) {

		return <Notes/>;
	}
	else {
		return <Login/>;
	}
};
