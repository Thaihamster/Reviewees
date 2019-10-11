class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index2
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
    @review = Review.find_by(post_id: @post.id, rating: params[:rating])
    @likes_count = Like.where(post_id: @post.id).count
    @reviews = Review.where(post_id: @post.id).order(created_at: :desc)
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      product_name: params[:product_name],
      content: params[:content],
      image_name: "m_e_others_500.jpg",
      user_id: @current_user.id
    )
    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/posts_images/#{@post.image_name}", image.read)
    end
    if @post.save
      flash[:notice] = "お気に入りの日用品を投稿しました！"
      redirect_to("/posts/index2")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.product_name = params[:product_name]
    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/posts_images/#{@post.image_name}", image.read)
    end
    if @post.save
      flash[:notice] ="投稿した口コミを編集しました"
      redirect_to("/posts/index2")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "日用品の投稿を削除しました"
    redirect_to("/posts/index2")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index2")
    end
  end

end
