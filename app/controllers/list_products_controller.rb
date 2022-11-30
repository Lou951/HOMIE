class ListProductsController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_user, only: %i[new create]
  before_action :set_product, only: %i[create]

  def new
    @list_product = ListProduct.new
    @products = Product.all
  end

  def index
    @list_products = ListProduct.all
  end

  # def show
  #   @list_product.find(params[:id]) - is this needed or called through list?
  # end

  def create
    @list_product = ListProduct.new(list_product_params)
    @list_product.product = @product
    @list_product.user = @user
    @list_product.list = @list
    if @list_product.save
      redirect_to list_path(@list), notice: 'Your list prodyuct was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'The product was not added to the list.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:list_product][:product_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_user
    @user = current_user
  end

  def list_product_params
    params.require(:list_product).permit(:frequency, :list_id, :product_id, :user_id)
  end
end
