import React, {Component} from 'react';

class Login extends Component {
	constructor(props) {
		super(props);
		this.state = {
			term: ''
		};
	}


	render() {
		return (

			<div class="loginwindow">
				<span class="h1">Login</span>  <br/>

			<input class="beer" placeholder="userid" type="text" />
				<br />
			<input placeholder="password" type="password"/>

			</div>
	)
	}


}


export default Login;
