class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    raise
    true
  end

  def upvote?
    true
  end
end
