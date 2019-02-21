class PhotoPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == photo.user
  end

  def destroy?
    return true if user.present? && user == photo.user
  end

  private

  def photo
    record
  end
end
