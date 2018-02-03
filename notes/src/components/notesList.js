import React, {Component} from 'react';
import {Tooltip, OverlayTrigger} from 'react-bootstrap';

import Note from './note';

class NotesList extends Component {
	constructor(props) {
		super(props);

		this.toggle = this.toggle.bind(this);
		this.state = {
			tooltipOpen : false,
			showList : false,
		};
	}

	toggle() {
		this.setState({
			tooltipOpen : !this.state.tooltipOpen
		});
	}


	onItemClick(event) {

		event.currentTarget.style.backgroundColor = '#ff0000';
		alert('test');
	};


	render() {

		const tooltip = (
			<Tooltip id="tooltip">
				List <strong>Owner</strong> and co-workers click.
			</Tooltip>
		);
		const numbers = [1, 2, 3, 4, 5];
		const listItems = numbers.map((number) =>
			<p>{number} <input/> <input onClick={this.onItemClick} type="checkbox"/> remove self
				<OverlayTrigger placement="top" overlay={tooltip}>
					<span className="glyphicon glyphicon-info-sign"></span>
				</OverlayTrigger></p>
		);

		if (this.state.showList) {
			return (
				<div className="coWorker">aaaaaaaaa
					{listItems}
				</div>
			)
		}
		else {
			return 	<div className="coWorker"><Note/></div>
		}

	}


}

export default NotesList;
