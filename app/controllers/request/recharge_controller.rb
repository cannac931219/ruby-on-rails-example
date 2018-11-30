class Request::RechargeController < RequestController
	def show
		
	end
	def index
		@recharge = Recharge.all
	end
	def new
		@user = User.where('id = ?', 1).all
		@bank = Bank.where('user_id = ?', 1).all
		@bankCard = UserBank.where('user_id = ?', 1).all
		@phone = User.where('id = ?', 1).first[:tel]
	end
	def create
		user_id = params[:user_id]
		phone = params[:phone]
		money = params[:money] 
		bank_card = params[:bank_card]
		agrmno = UserBank.where('user_id = ?', user_id).first[:agrmno]
		p agrmno
		if agrmno.blank?
			redirect_to '/request/recharge/contact'
		end
	end
	def contact
		@user = User.where('id = ?', 1).all
		@bank = Bank.where('user_id = ?', 1).all
		@bankCard = UserBank.where('user_id = ?', 1).all
		@phone = User.where('id = ?', 1).first[:tel]
	end
	def contact_create
		render :json => {
				:a => 'ok'
		}
	end
end
