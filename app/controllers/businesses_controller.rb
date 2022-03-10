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

  def edit
    @business = Business.find(params[:id])
    if @business.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @business = Business.find(params[:id])
    if @business.user_id == current_user.id
      @business.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def business_params
    params.require(:business).permit(:image, :name, :text, :category_id, :prefecture_id, :price,
                                     :company).merge(user_id: current_user.id)
  end
end
