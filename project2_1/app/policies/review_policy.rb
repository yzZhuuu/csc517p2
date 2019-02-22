class ReviewPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match (/admin|customer/)
  end

  def update?
    return true if @user.role.match (/admin/)
    return true if (user == review.user) && (@user.role.match (/customer/))
  end

  def destroy?
    return true if @user.role.match (/admin/)
    return true if (user == review.user) && (@user.role.match (/customer/))
  end

  def edit?
    return true if @user.role.match (/admin/)
    return true if (user == review.user) && (@user.role.match (/customer/))

  end

  private

  def review
    record
  end



end
