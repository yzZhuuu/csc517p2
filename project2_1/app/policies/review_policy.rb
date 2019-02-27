class ReviewPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match (/admin|customer/i)
  end

  def update?
    return true if @user.role.match (/admin/i)
    return true if (user == review.user) && (@user.role.match (/customer/i))
  end

  def destroy?
    return true if @user.role.match (/admin/i)
    return true if (user == review.user) && (@user.role.match (/customer/i))
  end

  def edit?
    return true if @user.role.match (/admin/i)
    return true if (user == review.user) && (@user.role.match (/customer/i))

  end

  private

  def review
    record
  end



end
