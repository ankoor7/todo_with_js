class User < ActiveRecord::Base
  attr_accessible :email, :name, :role, :twitter
  has_and_belongs_to_many :list

end
