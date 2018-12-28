class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def current_ymt
		@t = Time.new
		@ty = @t.year.to_s
		@tm = @t.month.to_s
		@tt = @t.day.to_s
		return @ty + @tm + @tt
	end

 	protected

 	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end


	def after_sign_out_path_for(resource_or_scope)
		user_session_path
	end

end