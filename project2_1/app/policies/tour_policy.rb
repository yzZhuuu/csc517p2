class TourPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == tour.user
  end

  def destroy?
    return true if user.present? && user == tour.user
  end

  private

  def tour
    record
  end

  def user
    @user
  end

end