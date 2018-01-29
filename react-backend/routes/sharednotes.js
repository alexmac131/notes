var express = require('express');
var router = express.Router();
var Client = require('pg-native');


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


module.exports = router;
