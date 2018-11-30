class Isa < ApplicationRecord
	has_many :isbs, :dependent => :destroy
end
