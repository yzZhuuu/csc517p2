class PhotoPolicy < ApplicationPolicy
  def create?
    return true if @user.role.match (/admin|agent/i)
  end

  def update?

    return true if @user.role.match (/admin/i)
    return true if (user == photo.user) && (@user.role.match (/agent/i))
  end

  def destroy?
    return true if @user.role.match (/admin/i)
    return true if (user == photo.user) && (@user.role.match (/agent/i))

  end

  private

  def photo
    record
  end
end
