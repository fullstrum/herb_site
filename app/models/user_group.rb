class UserGroup < ActiveRecord::Base
	attr_accessible :group_id

	belongs_to :User
	belongs_to :Group

	validates :user_id, presence: true
	validates :group_id, presence: true
end
