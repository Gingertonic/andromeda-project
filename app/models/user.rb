class User < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :aliens
  has_many :planets
  has_secure_password
end
