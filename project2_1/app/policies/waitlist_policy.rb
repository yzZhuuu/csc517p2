class WaitlistPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match(/admin|customer/i)
  end

  # def update?
  #   return true if user.present? && user == review.user
  # end
  #
  def destroy?
    return true if @user.role.match(/admin/i)
    return true if (user == waitlist.user) && (@user.role.match(/customer/i))
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
