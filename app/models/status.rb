class Status < ActiveRecord::Base
	belongs_to :user
	attr_accessor :hour, :mins,:hour1,:mins1
end
