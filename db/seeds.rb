# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
root = User.create( name: 'root', password:'rootroot', password_confirmation:'rootroot')
user = User.create( name: 'user', password:'rootroot', password_confirmation:'rootroot')
Event.create( creator: user , title: 'Second event', description: 'Second event created by User', event_date: Date.current )
Event.create( creator: root , title: 'first event', description: 'First event created by Root', event_date: Date.current )
