class BusinessesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_show, only: [:edit, :update]

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
    @comments = @business.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    if @business.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @business.update(business_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @business.user_id == current_user.id
      @business.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    if params[:q]&.dig(:name)
      squished_keywords = params[:q][:name].squish
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Business.ransack(params[:q])
    @business = @q.result
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end


  def business_params
    params.require(:business).permit(:name, :text, :category_id, :prefecture_id, :price,:company, images: []).merge(user_id: current_user.id)
  end

  def redirect_to_show
    return redirect_to root_path if current_user.id != @business.user.id
  end

end