class Art < ApplicationRecord
	# has_many :booklist, dependent: :destroy
	# has_many :booklist, dependent: :delete_all


	has_one :booklist, dependent: :destroy
	validates :title, presence: true, 
	                  length: { minimum: 5 }

end
