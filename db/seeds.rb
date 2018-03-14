# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create(name: 'admin1',    email: 'admin@abv.bg',     password: '123123', role: 'admin')
User.create(name: 'reseller1', email: 'reseller@abv.bg',  password: '123123', role: 'reseller', creator_id: 1)
User.create(name: 'reseller2', email: 'reseller2@abv.bg', password: '123123', role: 'reseller', creator_id: 1)
User.create(name: 'userr',     email: 'user@abv.bg',      password: '123123', role: 'user',     creator_id: 1)
User.create(name: 'userr2',    email: 'user2@abv.bg',     password: '123123', role: 'user',     creator_id: 2)
User.create(name: 'userr3',    email: 'user3@abv.bg',     password: '123123', role: 'user',     creator_id: 3)

User.create(name: 'admin2',    email: 'admin2@abv.bg',    password: '123123', role: 'admin')
User.create(name: 'reseller3', email: 'reseller3@abv.bg', password: '123123', role: 'reseller', creator_id: 7)
User.create(name: 'reseller4', email: 'reseller4@abv.bg', password: '123123', role: 'reseller', creator_id: 7)
User.create(name: 'userr4',    email: 'user4@abv.bg',     password: '123123', role: 'user',     creator_id: 7)
User.create(name: 'userr5',    email: 'user5@abv.bg',     password: '123123', role: 'user',     creator_id: 8)
User.create(name: 'userr6',    email: 'user6@abv.bg',     password: '123123', role: 'user',     creator_id: 9)
