import React, {Component} from 'react';

import Note from './note';
import {Tooltip, OverlayTrigger} from 'react-bootstrap';

class YourNotes extends Component {


	constructor(props, context) {
		super(props, context);

		this.toggle = this.toggle.bind(this);
		this.state = {
			tooltipOpen : false,
			showList : true
		};
		this.onItemClick = this.onItemClick.bind(this);
	}

	toggle() {
		this.setState({
			tooltipOpen : !this.state.tooltipOpen
		});
	}

	onItemClick(event) {


		this.setState({ showList: !this.state.showList});

	}

	render() {


		const tooltip = (
			<Tooltip id="tooltip">
				List <strong>Current</strong> co-workers seeing your note.
			</Tooltip>
		);
		const numbers = [1, 2, 3, 4, 5];
		const listItems = numbers.map((number) =>
			<p>{number} <input/> <input type="checkbox"/>Make Private


				<OverlayTrigger placement="top" overlay={tooltip}>
					<span className="glyphicon glyphicon-info-sign"></span>
				</OverlayTrigger>


			</p>
		);

		if (this.state.showList) {

			return (

				<div className="myNotes">
					{listItems}
					{this.props.value}
					<button className="btn btn-primary glyphicon glyphicon-refresh"></button>

					<button className="btn btn-primary glyphicon glyphicon-trash"></button>

					<button className="btn btn-danger glyphicon glyphicon-flag"></button>

					<button className="btn btn-danger glyphicon glyphicon-eye-close"></button>


					<button className="btn btn-danger glyphicon glyphicon-list-alt"
						onClick={this.onItemClick}></button>


				</div>
			)
		}
		else {
			return <Note>aaaaa</Note>
		}
	}

}


export default YourNotes;
