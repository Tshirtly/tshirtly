require 'active_record'

class Tshirt < ActiveRecord::Base
  has_many :transactions

end
