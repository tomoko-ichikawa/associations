class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
  end
  
  def destroy
    favorite = Favorite.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    favorite.destroy
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end
end
