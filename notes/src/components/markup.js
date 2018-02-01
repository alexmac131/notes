import {Component} from "react";

import React, {Component} from 'react';

class  Message extends Component {

	render() {
			return (

				<div>
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</select>

					Alex was here aaaa
					<Showlist value="yournotes">mylist</Showlist>
					<Showlist value="sharednotes">shared with me</Showlist>
				</div>
			)
		}


}
export default Message;
