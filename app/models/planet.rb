class Planet < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  belongs_to :user
  has_many :aliens
  validates :name, uniqueness: true
end
