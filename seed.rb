require_relative './lib/connection'
require_relative './lib/tshirts'
require_relative './lib/users'


david = User.create({
  name: "David"
})

jerome = User.create({
  name: "Jerome"
})

tyler = User.create({
  name: "Tyler"
})

katrina = User.create({
  name: "Katrina"
})

noel = User.create({
  name: "Noel"
})

Tshirt.create({
  color: "blue",
  quantity: 10,
  price: 15,
  user_id: 0
})

Tshirt.create({
  color: "red",
  quantity: 10,
  price: 15,
  user_id: 0
})

Tshirt.create({
  color: "purple",
  quantity: 10,
  price: 15,
  user_id: 0
})

Tshirt.create({
  color: "yellow",
  quantity: 10,
  price: 15,
  user_id: 0
})

