var express = require('express');
var Client = require('pg-native');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
	var client = new Client();
	client.connect('postgresql://localhost/notes', function (err) {
		if (err) {
			throw err
		}
		client.query('select user_id, name, username  from users where private = false and enabled = true and usertype = 1', function (err, rows) {
			if (err) {
				throw err;
				process.exit(1);
			}
			res.json(rows);

		})
	});
})
	.post('/', function (req, res, next) {
		res.send('respond with a user post');
	})

	.put('/', function (req, res, next) {
		res.send('respond with a resource user put');
	})
	.delete('/', function (req, res, next) {
		res.send('respond with a resource user delete');
	});

module.exports = router;
