class BookmarkPolicy < ApplicationPolicy

  def create?
    return true if @user.role.match (/admin|customer/)
  end

  def destroy?
    return true if @user.role.match (/admin/)
    return true if (user == book.user) && (@user.role.match (/customer/))
  end

  private

  def bookmark
    record
  end
end
