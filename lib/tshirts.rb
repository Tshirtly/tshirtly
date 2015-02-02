require 'active_record'

class Tshirt < ActiveRecord::Base
  belongs_to :user
end
