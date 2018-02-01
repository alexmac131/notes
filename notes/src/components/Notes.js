import React, {Component} from 'react';
import YourNotes from './yourNotes';
import CoWorker from  './coWorkers';

import { Button } from 'reactstrap';
class Notes extends Component {



	render() {

		return (
			<div>
				<Button color="danger">Danger!</Button>

				<YourNotes/>
				<CoWorker/>
			</div>
		)
	}

}


export default Notes;
