
class SessionsController < ApplicationController

	def new
	end

	def create
	admin = Admin.find_by(email: params[:session][:email].downcase)
		if admin && admin.authenticate(params[:session][:password])
			sign_in admin
			redirect_to root_url
		else
			if admin
				message = "Password salah"
			else
				message = "Email tidak terdaftar"
			end
			flash.now[:error] = message
			render 'new'
		end

	end

		def destroy
		sign_out
		redirect_to root_url
	end

end

end
