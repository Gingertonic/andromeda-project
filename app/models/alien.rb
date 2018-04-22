require_relative './concerns/slugifiable'

class Alien < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  belongs_to :planet
end
