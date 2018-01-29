var express = require('express');
var router = express.Router();
var Client = require('pg-native');

/* GET users listing. */
router.get('/', function (req, res, next) {
	var client = new Client();
	client.connect('postgresql://localhost/notes', function (err) {
		if (err) {
			throw err
		}
		client.query('select * from users where usertype=1 and private = false and enabled = true;', function (err, rows) {
			if (err) {
				throw err;
				process.exit(1);
			}
			res.json(rows);

		})
	});

})
	.post('/', function (req, res, next) {
		res.send('respond with a note post');
	})

	.put('/', function (req, res, next) {
		res.send('respond with a resource note put');
	})
	.delete('/', function (req, res, next) {
		res.send('respond with a resource note delete');
	});


function getData(query) {
	// database postgresql

	// Test connnection


}

module.exports = router;
