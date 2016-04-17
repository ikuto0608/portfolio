class Sns::Kind
  include Ehon

  FACEBOOK = enum 0, name: 'Facebook', prefix: 'https://www.facebook.com/'
  GITHUB     = enum 1, name: 'Github', prefix: 'https://github.com/'
  INSTAGRAM = enum 2, name: 'Instagram', prefix: 'https://www.instagram.com/'
  LINKEDIN = enum 3, name: 'Linkedin', prefix: 'https://www.linkedin.com/in/'
  TWITTER = enum 4, name: 'Twitter', prefix: 'https://twitter.com/'
end
