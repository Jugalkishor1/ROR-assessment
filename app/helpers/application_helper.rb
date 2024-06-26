# frozen_string_literal: true

module ApplicationHelper
  def calculate_likes(post)
    @likes = Like.find_by(post_id: post.id)
    @likes = @likes.user_id.count
  end

  def post_already_liked?(post_id)
    @like = Like.where(post_id:).where('user_id @> ?', "{#{current_user.id}}").present?
  end
end
