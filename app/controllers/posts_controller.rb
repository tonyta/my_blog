class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Your post was created!' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Your post was updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
