class Group < ActiveRecord::Base
	attr_accessible :group_name

	#has_many :user_groups, :dependent => :destroy
	#has_many :users, :through => :user_groups
end
