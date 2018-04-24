class User < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :planets
  has_many :aliens, :through => :planets
  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
end
