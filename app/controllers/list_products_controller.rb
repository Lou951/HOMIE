class ListProductsController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_user, only: %i[new create]
  before_action :set_product, only: %i[new create]

  def new
    @list_product = ListProduct.new
  end

  def index
    @list_product = ListProduct.all
  end

  def show
    @list_product.find(params[:id])
  end

  def create
    @list_product = ListProduct.new(list_product_params)
    @list_product.user = current_user
    @list_product.product = @product.id
    @list_product.list = @list.id
    @list_product.save
  end

  private

  def set_product
    @list_product.product = Product.find(params[:product_id])
  end

  def set_list
    @list_product.list = List.find(params[:list_id])
  end

  def set_user
    @list_product.user = current_user
  end

  def list_product_params
    params.require(:list_product).permit(:frequency, :list_id, :product_id)
  end
end
