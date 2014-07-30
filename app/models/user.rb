class User < ActiveRecord::Base
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :attendences
  has_many :statuses
   

  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


end
