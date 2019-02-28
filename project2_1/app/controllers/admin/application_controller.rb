# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    #http_basic_authenticate_with name: "god@admin.com", password: "password"
    # before_action :authenticate
    #
    # def authenticate
    #
    #   @auser = Tour.find(params[current_user.id])
    #
    #   if @auser.email != 'god@admin.com'
    #     respond_to do |format|
    #       format.html { redirect_to root_path, method: :get,notice: 'user is not authorized.' }
    #       # format.json { head :no_content }
    #     end
    #
    #   end
    #
    #
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
     def records_per_page
       params[:per_page] || 20
     end
  end
end
