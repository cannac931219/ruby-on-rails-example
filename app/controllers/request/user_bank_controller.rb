class Request::UserBankController < RequestController
	def index
		@userbank = UserBank.all
	end

	def new
		@user = User.all
		@bank = Bank.where('id = ?', 15).all
		@bankbranch = BankBranch.where('bank_id = ?', 15).all
	end

	def create
		user_id = params[:user_id]
		agrmno = params[:agrmno]
		bank_card = params[:bank_card]
		bank_id = params[:bank_id]
		branch_id = params[:branch_id]
		if agrmno.blank?
		end
		user_name = User.find(user_id).user_name
		bank_name = Bank.find(bank_id).bank_name
		branch_name = BankBranch.find(branch_id).branch_name
		userbank = UserBank.create!({
			:bank_card => bank_card,
			:bank_id => bank_id,
			:bank_name => bank_name,
			:branch_name => branch_name,
			:user_name => user_name,
			:user_id => user_id,
			:agrmno => agrmno
		})
		if userbank.save!
			redirect_to '/request/user_bank'
		else 
			redirect_to '/request/user_bank/new'
		end
	end

	def select_with_ajax
		@bankbranch = BankBranch.where('bank_id = ?', params[:bank_id]).all
	end
end
