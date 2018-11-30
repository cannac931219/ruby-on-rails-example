class Admin::ArtPersonController < AdminController
	def index
		@title = 'artperson title'
		
		allinpay = Allinpay.new
		# @str1 = allinpay.signature_generate('abc')
	end

	def show
	end
end
