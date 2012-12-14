class User < ActiveRecord::Base
	attr_accessible :firstName, :lastName, :email, :password, :password_confirmation
	has_secure_password

	#has_many :groups, through => :user_groups

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :firstName, presence: true, length: { maximum: 50}
	validates :lastName, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    def add_to_group!(group)
    	user_groups.create!(group_id: group.id)
    end

    def remove_from_group!(group)
    	user_groups.find_by_group_id(group.id).destroy
    end

    private

	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end
    
end
