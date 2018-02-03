import React, {Component} from 'react';
import {Tooltip, OverlayTrigger} from 'react-bootstrap';

class MakeNote extends Component {

	render() {

		const tooltip = (
			<Tooltip id="tooltip">
				Save Note
			</Tooltip>
		);

		const makePrivate =  (
			<Tooltip id="makeprivate">Make Private</Tooltip>
		);


		const makePublic =  (
			<Tooltip id="makePublic">Make Public</Tooltip>
		);

		const addCoWorker =  (
					<Tooltip id="addCoWorker">Add CoWorker</Tooltip>
				);


		return (

			<div className="noteMain">ssssss
				<OverlayTrigger placement="top" overlay={makePrivate}>
				<button className="btn btn-danger glyphicon glyphicon-eye-close"></button>
				</OverlayTrigger>

				<OverlayTrigger placement="top" overlay={makePublic}>
				<button className="btn btn-danger glyphicon glyphicon-eye-open"></button>
				</OverlayTrigger>
				<input/>
				<textarea className="form-control" defaultValue={this.props.children}></textarea>

				<OverlayTrigger placement="top" overlay={tooltip}>
				<button className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"></button>
				</OverlayTrigger>

				<OverlayTrigger placement="top" overlay={addCoWorker}>
							<button className="btn btn-success btn-sm glyphicon glyphicon-plus"></button>
							</OverlayTrigger>
			</div>

		)
	}


}

export default MakeNote;
