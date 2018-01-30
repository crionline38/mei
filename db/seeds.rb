# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Function.destroy_all

function = Function.create({name: "Adhérent"})
function = Function.create({name: "Professeur"})
function = Function.create({name: "Bureau"})
function = Function.create({name: "Secrétaire"})
function = Function.create({name: "Trésorier"})
function = Function.create({name: "Président"})
function = Function.create({name: "Admin"})
