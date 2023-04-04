class WordingPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      # if user.admin?
      scope.all
      # else
      #   scope.where(published: true)
      # end
    end

    private

    attr_reader :user, :scope
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    record.user
  end
end
