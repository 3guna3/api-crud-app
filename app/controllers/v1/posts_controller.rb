class V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  def index
    posts = Post.all
    render json: posts
  end

  def show
    render json: @post
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @pst
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
