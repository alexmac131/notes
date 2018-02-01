import React, {Component} from 'react';


class Login extends Component {
	constructor(props) {
		super(props);
		this.state = {
			term: ''
		};
	}

	onItemClick (event) {

	    event.currentTarget.style.backgroundColor = '#ff0000';
			alert ('test');
	};



	render() {
		return (

			<div class="loginwindow">
				<span class="h1">Login </span>  <br/>

			<input class="beer" placeholder="userid" type="text" />
				<br />
			<input placeholder="password" type="password"/>
				<br />
				<button onClick={this.onItemClick}  class="btn btn-primary glyphicon ">Login</button>

			</div>
	)
	}


}


export default Login;
