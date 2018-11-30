class Bank < ApplicationRecord
	has_many :bank_branch, class_name: 'BankBranch', foreign_key: "bank_id"
	belongs_to :user, foreign_key: "user_id"
end
