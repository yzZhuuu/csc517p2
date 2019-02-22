class WaitlistPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match? (/admin|customer/)
  end

  # def update?
  #   return true if user.present? && user == review.user
  # end
  #
  def destroy?
    return true if @user.role.match? (/admin/)
    return true if (user == waitlist.user) && (@user.role.match? (/customer/))
  end
  #
  # def edit?
  #   return true if user.present? && user == review.user
  # end

  private

  def waitlist
    record
  end
end
