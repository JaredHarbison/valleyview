class PostsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new]

  def new
    @branch = params[:branch]
    @categories = Category.where(branch: @branch)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @posts = Post.all
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
  end

  def delete
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
        format.js { render :layout => false }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post }
    end
  end

  def hobby
    posts_for_branch(params[:action])
  end

  def study
    posts_for_branch(params[:action])
  end

  def team
    posts_for_branch(params[:action])
  end

  def apps 
    posts_for_branch(params[:action])
  end 

  def companies 
    posts_for_branch(params[:action])
  end 

  def inventions 
    posts_for_branch(params[:action])
  end 

  private

  def posts_for_branch(branch)
    @categories = Category.where(branch: branch)
    @posts = get_posts.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.js { render partial: 'posts/posts_pagination_page' }
    end
  end

  def get_posts
    PostsForBranchService.new({
      search: params[:search],
      category: params[:category],
      branch: params[:action]
    }).call
  end

  def post_params
    params.require(:post).permit(:content, :title, :category_id)
                         .merge(user_id: current_user.id)
  end

end
