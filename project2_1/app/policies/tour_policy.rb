class TourPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    return true if @user.role.match? (/admin|agent/)
  end

  def show?
    user.present?
  end

  def update?
    #return true if user.present? && user == tour.user
    return true if @user.role.match? (/customer/ )
  end

  def destroy?
    #return true if user.present? && user == tour.user
    return true if @user.role.match? (/admin|agent/)
  end

  private

  def tour
    record
  end

  def user
    @user
  end

end