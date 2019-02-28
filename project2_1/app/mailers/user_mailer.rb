class UserMailer < ApplicationMailer
  default from: 'giveyourbestgift@gmail.com'

  def book_confirm_email
    @user = User.find(params[:user])
    mail(to: @user.email, subject: 'Your Booking is updated')
  end
end
