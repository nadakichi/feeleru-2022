class FavoritesController < ApplicationController

  def create
    @business_favorite = Favorite.new(user_id: current_user.id, business_id: params[:business_id])
    @business_favorite.save
    redirect_back fallback_location: root_path(params[:business_id])
  end

  def destroy
    @business_favorite = Favorite.find_by(user_id: current_user.id, business_id: params[:business_id])
    @business_favorite.destroy
    redirect_back fallback_location: root_path(params[:business_id])
  end
end
