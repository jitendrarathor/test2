class Project < ActiveRecord::Base
	has_many :groupprojects
  has_many :users, :through => :groupprojects
end
