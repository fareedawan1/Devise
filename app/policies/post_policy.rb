# frozen_string_literal: true

# post policy

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user.id == post.user_id
  end

  def destroy?
    return true if user.present? && user.id == post.user_id
  end

  def edit?
    user.present?
  end

  private

  def post
    record
  end
end
