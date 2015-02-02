require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/users'
require_relative './lib/tshirts'
require_relative './lib/transactions'

require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/:id") do
  erb(:show)
end

post '/users' do
  user_hash = {
    name: params["name"],
    email: params["email"]
  }

  User.create(user_hash)

  erb :"users/index", locals: { users: User.all() }
  redirect "/users"
end

put("/user/:id") do
  user = User.find_by({id: params[:id]})
  user_hash = {
    name: params["name"],
    email: params["email"]
  }
  puts user_hash

  user.update(user_hash)

  redirect ("/users")
end

# get("/users") do
#   erb(:"users/index", { locals: { users: User.all() } })
# end

# get("/users/new") do

#   erb(:"users/new", { locals: { users: User.all() } })
# end

# get("/user/:id") do
#   user = User.find_by({id: params[:id]})
  
#   erb(:"users/show", { locals: { user: user } })
# end

# post '/users' do
#   user_hash = {
#     name: params["name"]
#   }

#   User.create(user_hash)

#   erb :"users/index", locals: { users: User.all() }
#   redirect "/users"
# end


# put("/user/:id") do
#   user = User.find_by({id: params[:id]})
#   user_hash = {
#     name: params["name"]
#   }
#   puts user_hash

#   user.update(user_hash)

#   redirect ("/users")
# end

# delete("/user/:id") do
#   user = User.find_by({id: params[:id]})
#   tshirt = Tshirt.where({user_id: params[:id]})

#   end
#   tshirts.each do |tshirt|
#     tshirt.destroy
#   end
#   user.destroy

#   redirect "/users"
# end

# get("/user/:id/edit") do
#   user = User.find_by({id: params[:id]})
#   erb(:"users/edit", { locals: { user: user } })
# end

# get("/tshirts") do
#   erb(:"tshirts/index", { locals: { tshirts: Tshirt.all() } })
# end

# post("/tshirts") do
#   tshirt_hash = {
#     color: params["color"],
#     user_id: params["user_id"]
#     quantity: quantity: 1,
#     price: 15
#   }

#   tshirt = Tshirt.create(tshirt_hash)

#   redirect"/tshirt/#{tshirt.id}"
# end


# get("/tshirt/:id") do
#   puts "Hit the route /:id"
#   tshirt = Tshirt.find_by({id: params[:id]})

#   erb(:"tshirts/show", { locals: { tshirt: tshirt } })
# end



# get("/tshirt/:id/edit") do
#   tshirt = Tshirt.find_by({id: params[:id]})

#   erb(:"tshirts/edit", { locals: { tshirt: tshirt, users: User.all() } })
# end

# put("/tshirt/:id") do
#   tshirt_hash = {
#     color: params["color"],
#     user_id: params["user_id"]
#   }

#   tshirt = Tshirt.find_by({id: params[:id]})
#   tshirt.update(tshirt_hash)

#   erb(:"tshirts/show", { locals: { tshirt: tshirt } })
# end

# delete("/tshirt/:id") do
#   tshirt = Tshirt.find_by({id: params[:id]})

#   tshirt.destroy

#   redirect "/tshirts"
# end

# get("/tshirts/new") do

#   erb(:"tshirts/new", { locals: { users: User.all() } })
# end
