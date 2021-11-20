class V1::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def show
    render json: @post
  end

  def create; end

  def update; end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
