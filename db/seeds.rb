# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(full_name: 'Admin.User', first_name: 'Admin', last_name: 'User', email: 'hogehoge@hoge.com', password: '12345678', occupation: 'Web Developer', live: 'Vancouver', avator_url: 'http://www.gravatar.com/hogehoge', admin: true)
