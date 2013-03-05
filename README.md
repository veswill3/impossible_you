Impossible You
=============
To get up and running, here are some settings I missed the first time around for postgres
* make sure you do not need to specify a password in your database.yml
	* [Read this](http://stackoverflow.com/questions/5546301/ruby-on-rails-postgresql-ignores-my-password-in-database-yml), but basically, edit your ph_hba.conf file in /etc/postgres/9.1/main/ so that your "local all all" line has trust at the end instead of md5
	* then make sure to restart postgres: /etc/init.d/postgres restart
* Setup a new role in postgres for the app
	* psql template1
	* create role impossible_you with createdb login password 'impossible_you';