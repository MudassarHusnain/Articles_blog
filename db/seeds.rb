# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users=User.create!([{
                      username: 'mudassarjuttsab56',
                      email: "mudassarjuttsab56@gmail.com",
                      password: "123456789",
                      admin: true
                    },
                    {
                      username: 'usmansab',
                      email: "usmansab@gmail.com",
                      password: "123456789",
                      admin: false
                    }])

p 'created #{users.count}'
