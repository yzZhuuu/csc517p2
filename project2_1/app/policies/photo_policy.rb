class PhotoPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match (/admin|agent/)
  end

  def update?
    return true if @user.role.match (/admin/)
    return true if (user == tour.user) && (@user.role.match (/agent/))
  end

  def destroy?
    return true if @user.role.match (/admin/)
    return true if (user == tour.user) && (@user.role.match (/agent/))
  end

  private

  def photo
    record
  end
end
