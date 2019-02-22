class BookPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match? (/admin|customer/)
  end

  def update?
    return true if @user.role.match? (/admin/)
    return true if (user == book.user) && (@user.role.match? (/customer/))
  end
  #
  def destroy?
    return true if @user.role.match? (/admin/)
    return true if (user == book.user) && (@user.role.match? (/customer/))
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
