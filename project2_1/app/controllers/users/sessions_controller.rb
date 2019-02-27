# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   #   if user = authenticate_with_google
  #   #     cookies.signed[:user_id] = user.id
  #   #     redirect_to user
  #   #   else
  #   #     redirect_to new_user_session_url, alert: 'authentication_failed'
  #   #   end
  #   # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:role, :name])
   end
end

private
def authenticate_with_google
  if flash[:google_sign_in_token].present?
    User.find_by google_id: GoogleSignIn::Identity.new(flash[:google_sign_in_token]).user_id
  end
end
