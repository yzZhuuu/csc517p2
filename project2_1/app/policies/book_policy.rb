class BookPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == book.user
  end
  #
  def destroy?
    return true if user.present? && user == book.user
  end
  #
  def edit?
    return true if user.present? && user == book.user
  end

  private

  def book
    record
  end
end
