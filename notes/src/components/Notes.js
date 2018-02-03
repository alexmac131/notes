import React, {Component} from 'react';
import MakeNote from './note';
import NotesList from './notesList';

import { Button } from 'reactstrap';
class Notes extends Component {



	render() {

		return (
			<div>


				<NotesList/>
				<MakeNote/>
			</div>
		)
	}

}


export default Notes;
