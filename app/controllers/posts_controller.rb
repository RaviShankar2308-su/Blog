# frozen_string_literal: true

# First it will authorize the request
# It will return the value according to the calling method
# if the index method called then, it will return all the posts of the current user
# if the create method called then, current user is able to create his posts
class PostsController < ApplicationController
  before_action :require_user, only: %i[index new create]

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      ActionCable.server.broadcast('blog_channel', @post.as_json)
      redirect_to posts_path, notice: 'Post created successfully!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
