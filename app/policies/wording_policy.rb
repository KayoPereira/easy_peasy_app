class WordingPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    can_manage? || user.student? || user.teacher?
  end

  def show?
    index?
  end

  def new?
    can_manage?
  end

  def create?
    can_manage?
  end

  def edit?
    can_manage?
  end

  def update?
    can_manage?
  end

  def destroy?
    can_manage?
  end

  private

  def can_manage?
    user.admin?
  end
end
