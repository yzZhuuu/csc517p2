class TourPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    return true if @user.role.match (/admin|agent/i)
  end

  def show?
    user.present?
  end

  def update?
    #return true if user.present? && user == tour.user
    return true if @user.role.match (/admin/i)
    return true if user == (tour.user) && ( @user.role.match(/agent/i) ) && (tour.status != "completed")
  end

  def destroy?
    #return true if user.present? && user == tour.user
    return true if @user.role.match (/admin/i)
    return true if (user == tour.user) && (@user.role.match(/agent/i))
  end

  private

  def tour
    record
  end

  def user
    @user
  end

end