require 'sinatra'
require 'sinatra/reloader'
require 'json'
require_relative './lib/connection'
require_relative './lib/users'
require_relative './lib/tshirts'
require_relative './lib/transactions'
require 'pry'

use Rack::Session::Pool, :cookie_only => false

secret_password = ''
json = ''
File.open('secret.json', 'r') do |f|
  f.each_line do |line|
    json << line
  end
end
json_hash = JSON.parse(json)
secret_password = json_hash['password']


def authenticated?
  session[:valid_user] == true
end

post '/admin' do
  if params[:password] === secret_password
    session[:valid_user] = true
    redirect '/admin_confirm'
  else
    redirect '/'
  end
end

get '/admin_confirm' do
  if authenticated?
    redirect  '/admin'
  else
    redirect '/'
  end
end

get '/secret_page2' do
  if authenticated?
    return 'Hello! <a href = "http://localhost:4567/secret_page">Secret Page</a>'
  else
    redirect '/'
  end
end



after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb :index, locals: {tshirts: Tshirt.all(), users: User.all(), transactions: Transaction.all() }
end

get("/tshirt/:id") do
  tshirt = Tshirt.find_by({id: params[:id]})

  erb :show, locals: {tshirt: tshirt, transactions: Transaction.all()}
end

post '/users/new' do

  user_hash = {
    name: params["name"],
    email: params["email"]
  }

  User.create(user_hash)

  erb :index, locals: { users: User.all() }
  redirect "/"
end

put("/user/:id") do
  user = User.find_by({id: params[:id]})
  user_hash = {
    name: params["name"],
    email: params["email"]
  }
  puts user_hash

  user.update(user_hash)

  redirect ("/")
end

put("/tshirt/:id/stock") do
  tshirt = Tshirt.find_by({id: params[:id]})

  puts "what's left = #{tshirt.quantity}"

  new_total = tshirt.quantity + params["quantity"].to_i
  puts new_total
  tshirt_hash = {
    quantity: new_total
  }
  tshirt.update(tshirt_hash)

  redirect ("/admin")
end

put("/transaction/:tshirt_id") do
  tshirt = Tshirt.find_by({id: params[:tshirt_id]})
  user = User.find_by({email: params[:email]})

  puts "what's left = #{tshirt.quantity}"

  new_total = tshirt.quantity - params["quantity"].to_i

  transaction_hash = {
    quantity: params[:quantity].to_i,
    user_id: user.id,
    tshirt_id: tshirt.id
  }

  transaction = Transaction.create(transaction_hash)

  tshirt_hash = {
    quantity: new_total
  }
  tshirt.update(tshirt_hash)

  redirect ("/")
end

get("/admin") do

    erb :admin,  locals: { users: User.all(), tshirts: Tshirt.all(), transactions: Transaction.all() }
  end


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
