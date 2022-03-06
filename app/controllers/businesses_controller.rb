class BusinessesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @businesses = Business.order('created_at DESC')
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  private

  def business_params
    params.require(:business).permit(:image, :name, :text, :category_id, :prefecture_id, :price,
                                     :company).merge(user_id: current_user.id)
  end
end
