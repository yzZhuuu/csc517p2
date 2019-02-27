class BookmarkPolicy < ApplicationPolicy

  def create?
    return true if @user.role.match (/admin|customer/i)
  end

  def destroy?
    return true if @user.role.match (/admin/i)
    return true if (user == book.user) && (@user.role.match (/customer/i))
  end

  private

  def bookmark
    record
  end
end
