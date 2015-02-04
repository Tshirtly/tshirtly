require_relative './lib/connection'
require_relative './lib/tshirts'
require_relative './lib/users'
require_relative './lib/password'

adminDave = Admin.create({
  admin: "david", 
  password: "admin"
})

david = User.create({
  name: "David",
  email: "david@gmail.com"
})

jerome = User.create({
  name: "Jerome",
  email: "jerome@gmail.com"
})

tyler = User.create({
  name: "Tyler",
  email: "tyler@gmail.com"
})

katrina = User.create({
  name: "Katrina",
  email: "katrina@gmail.com"
})

noel = User.create({
  name: "Noel",
  email: "noel@gmail.com"
})

Tshirt.create({
  color: "blue",
  quantity: 10,
  price: 15,
  img: "http://i.imgur.com/o4FNEwJ.jpg?1"
})

Tshirt.create({
  color: "red",
  quantity: 10,
  price: 15,
  img: "http://i.imgur.com/wonz2W6.jpg?1"
})

Tshirt.create({
  color: "purple",
  quantity: 10,
  price: 15,
  img: "http://i.imgur.com/Q8IdUB1.jpg?1"
})

Tshirt.create({
  color: "yellow",
  quantity: 10,
  price: 15,
  img: "http://i.imgur.com/FYPrFN5.jpg?1"
})

