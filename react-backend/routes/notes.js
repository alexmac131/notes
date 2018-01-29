var express = require('express');
var router = express.Router();
var Client = require('pg-native');

/* GET users listing. */
router.get('/', function (req, res, next) {
	var client = new Client();
	console.log ('notes get');
	client.connect('postgresql://localhost/notes', function (err) {
		if (err) {
			throw err
		}

		//select * from sharewith a, notes b where b.owner_id = 1 and  a.shared_id = 1
		client.query('select * from notes a, sharewith where owner_id = 1 and sharewith_id = 1 and deleted = false and private = false;', function (err, rows) {
			if (err) {
				throw err;
				process.exit(1);
			}
			res.json(rows);

		})
	});

})
	.post('/', function (req, res, next) {
		console.log ("request body %o", req.query.user_id); // the poster is the owner
		res.send('respond with a note post');

		//insert into notes
	})

	.put('/', function (req, res, next) {
		// update specific columns  - make sure not locked or private if not owner
		console.log ("request body %o", req.query.user_id);
		res.send('respond with a resource note put');
	})
	.delete('/', function (req, res, next) {
		// toggle the delete flag  - make sure owner
		res.send('respond with a resource note delete');
	});


function getData(query) {
	// database postgresql

	// Test connnection


}

module.exports = router;
