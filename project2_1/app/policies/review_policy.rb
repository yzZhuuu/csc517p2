class ReviewPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == review.user
  end

  def destroy?
    return true if user.present? && user == review.user
  end

  def edit?
    return true if user.present? && user == review.user
  end

  private

  def review
    record
  end



end
