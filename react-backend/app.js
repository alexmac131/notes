var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var Client = require('pg-native');
var session = require('express-session');
var uuid = require('uuid');

var Conf = require("./config/server.conf");
var secretServiceID = genuuid("Secret Service ID creation");


// database postgresql
var client = new Client();
/*
// Test connnection
client.connect('postgresql://localhost/notes', function (err) {
	if (err) {
		throw err
	}
	client.query('SELECT  * from users', function (err, rows) {
		if (err) {
			throw err;
			process.exit(1);
		}
		console.log(rows[0]);
	})
}); */


var index = require('./routes/index');
var users = require('./routes/users');
var notes = require('./routes/notes');
var sharednotes = require('./routes/sharednotes');
var logout = require('./routes/logout');
var coworkers = require('./routes/coworkers');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : false}));
app.use(cookieParser());

app.use(
	session({
		name : Conf.sessionName,
		genid : function (request) {

			return genuuid("session");
		},
		secret : secretServiceID, // generated before we get here above;
		rolling : true,
		resave : true,
		cookie : {secure : false},
		saveUninitialized : true
	})
);

app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/users',  users);
app.use('/notes',  notes);
app.use('/sharednotes', sharednotes);
app.use('/logout', logout);
app.use('/coworkers',coworkers);


// catch 404 and forward to error handler
app.use(function (req, res, next) {
	var err = new Error('Not Found');
	err.status = 404;
	next(err);
});

// error handler
app.use(function (err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};

	// render the error page
	res.status(err.status || 500);
	res.render('error');
});

function genuuid (whoCalledMe) {
    return  uuid.v1({
        node: [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
        clockseq: 0x1234,
        msecs: new Date('2014-07-01').getTime(),
        nsecs: 5678
    });
}

function hello () {

	console.log ('hello there');
}


function   authenticate (req, res,next ) {

	console.log ('auth');
	client.connect('postgresql://localhost/notes', function (err) {
		if (err) {
			throw err
		}
		client.query("select * from users where username = 'aleddx' and password = 'beer'", function (err, rows) {
			if (err) {
				throw err;
				process.exit(1);
			}
			if (typeof rows[0] === "undefined") {
				console.log ('redirect to logout');
				// we want to destroy and sessions etc  so don't redirect to /
				return res.redirect('/logout');
			}
			else {

				console.log(rows[0]);
				console.log ('go to the notes section');
				next();
			}

		})
	});
	next();

}

function validLogin (req, res, next) {
  if (req.session && req.session.userId) {
    return next();
  } else {
    var err = new Error('You must be logged in to view this page.');
    err.status = 401;
		return res.redirect('/logout');
  }
}
module.exports = app;
