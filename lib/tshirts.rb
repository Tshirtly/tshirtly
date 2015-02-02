require 'active_record'

class Tshirt < ActiveRecord::Base
  def users
    User.where({user_id: self.id})
  end
end
