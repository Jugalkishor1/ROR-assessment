# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Like.find_or_initialize_by(post_id: params[:post_id])

    unless @post.user_id.include?(current_user.id)
      @post.user_id.push(current_user.id)
      @post.save
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def unlike_post
    @like = Like.find_by(post_id: params[:post_id])
    @like.user_id.delete(current_user.id.to_s)
    @like.save
    respond_to do |format|
      format.html { redirect_to users_dashboard_path }
      format.js
    end
  end
end
