# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(full_name: 'Ikuto.Yata', first_name: 'Ikuto', last_name: 'Yata', email: 'ikuto0608@me.com', password: '12345678', occupation: 'Web Developer', live: 'Vancouver', avator_url: 'http://www.gravatar.com/avatar/5e177e2c9a533352fe8a0374fe4e7090', admin: true)
Product.create(user_id: user.id, name: 'The website about events schedule in Kyoto', about: 'kyoto', based_on: 'Rails', url: 'http://kyonoyotei.com', degree: 2)
Product.create(user_id: user.id, name: 'Portfolio site', about: 'mine', based_on: 'Rails', url: 'https://github.com/ikuto0608', degree: 1)
Skill::Hobby.create(user_id: user.id, name: 'Photography', degree: 2)
Skill::Hobby.create(user_id: user.id, name: 'Movie', degree: 1)
Skill::Hobby.create(user_id: user.id, name: 'Anime', degree: 1)
Skill::Hobby.create(user_id: user.id, name: 'Kyoto', degree: 1)
Skill::Work.create(user_id: user.id, name: 'Ruby', degree: 1)
Skill::Work.create(user_id: user.id, name: 'Ruby on Rails', degree: 2)
Skill::Work.create(user_id: user.id, name: 'Javascript', degree: 1)
Skill::Work.create(user_id: user.id, name: 'C++', degree: 1)
Experience.create(user_id: user.id, name: 'IBM Japan Services Company Ltd.', year: 3, language: 'C++')
Experience.create(user_id: user.id, name: 'Happy Elements K.K', year: 1, language: 'Rails')
Sns.create(user_id: user.id, url: 'https://www.facebook.com/ikuto.yata', kind: Sns::Kind::FACEBOOK.id)
Sns.create(user_id: user.id, url: 'https://github.com/ikuto0608', kind: Sns::Kind::GITHUB.id)
Sns.create(user_id: user.id, url: 'https://www.instagram.com/ikuto0608/', kind: Sns::Kind::INSTAGRAM.id)
Sns.create(user_id: user.id, url: 'https://www.linkedin.com/in/ikutoyata', kind: Sns::Kind::LINKEDIN.id)
Sns.create(user_id: user.id, url: 'https://twitter.com/ikuto0608', kind: Sns::Kind::TWITTER.id)
