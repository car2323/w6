# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tournament1=Tournament.create(name: 'tournament1')
tournament2=Tournament.create(name: 'tournament2')
tournament3=Tournament.create(name: 'tournament3')

player1=Player.create(name: 'player1') 
player2=Player.create(name: 'player2') 
player3=Player.create(name: 'player3')
player4=Player.create(name: 'player4') 
player5=Player.create(name: 'player5') 

Registration.create(tournament_id: tournament3, player_id: player1)
Registration.create(tournament_id: tournament3, player_id: player5)
Registration.create(tournament_id: tournament3, player_id: player3)
Registration.create(tournament_id: tournament3, player_id: player4)
Registration.create(tournament_id: tournament2, player_id: player2)
Registration.create(tournament_id: tournament2, player_id: player1)
