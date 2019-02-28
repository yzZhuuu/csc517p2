# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    # before_action :authenticate_user!
    # include Administrate::Punditize
    #http_basic_authenticate_with name: "god@admin.com", password: "password"
    # before_action :authenticate
    # def authenticate
    #   authenticate_or_request_with_http_basic "Login to admin dashboard" do |user_name, password|
    #    user_name == "god@admin.com" && password == "password"
    #   end
    # end
    #
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    #
    # private
    #
    # def user_not_authorized(exception)
    #   flash[:notice] = "You are not authorized to perform this action."
    #   redirect_to(request.referrer || root_path)
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
     def records_per_page
       params[:per_page] || 20
     end
  end
end
