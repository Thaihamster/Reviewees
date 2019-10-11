class ReviewsController < ApplicationController
  before_action :authenticate_user

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @review = Review.new(
      user_id: @current_user.id,
      post_id: params[:post_id],
      content: params[:content],
      rating: params[:rating]
    )
    @post = Post.find_by(id: params[:post_id])
    if @review.save
      flash[:notice] = "口コミを投稿しました！"
      redirect_to("/posts/#{params[:post_id]}")
    else
      render("reviews/new")
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    @post = Post.find_by(id: params[:post_id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.content = params[:content]
    @review.rating = params[:rating]
    @post = Post.find_by(id: params[:post_id])
    if @review.save
      flash[:notice] = "口コミを編集しました！"
      redirect_to("/posts/#{params[:post_id]}")
    else
      render("reviews/edit")
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    flash[:notice] = "口コミを削除しました"
    redirect_to("/posts/#{params[:post_id]}")
  end

end
