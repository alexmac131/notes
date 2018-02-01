import React, {Component} from 'react';
import './App.css';


import Login from './components/login';
import Notes from './components/Notes';



class App extends Component {


	constructor(props) {
		super(props);
		this.state = {
			term : ''
		};
	}



	render() {
		return <FrontDoor isLoggedIn={true}/>

	}
}

export default App;
function FrontDoor(props) {
		console.log ('aaaa');
		const isLoggedIn = props.isLoggedIn;



		if (isLoggedIn) {

			return <Notes/>;
		}
		else {
			return <Login/>;
		}


	};
