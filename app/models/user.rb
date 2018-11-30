class User < ApplicationRecord
	has_many :bank
	has_many :user_bank
	has_many :recharge

	mount_uploader :avatar, AvatarUploader
end
