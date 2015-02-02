require 'active_record'

class User < ActiveRecord::Base
  def tshirts 
    Tshirt.where({user_id: self.id})
  end
end
