class ListProductsController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_user, only: %i[new create]
  before_action :set_product, only: %i[create]

  def new
    @list_product = ListProduct.new
    @products = Product.all
  end

  def index
    # @list_products = ListProduct.all
    if params[:query].present?
      @list_products = PgSearch.multisearch(params[:query])
      @products = []
      @list_products.each { |item| @products << Product.find(item.searchable_id) }
    else
      @list_products = ListProduct.all
    end
  end

  def show
    @list_product = ListProduct.find(params[:id])
  end

  def create
    @list_product = ListProduct.new(list_product_params)
    @list_product.product = @product
    @list_product.user = @user
    @list_product.list = @list
    @list_product.next_purchase = @list_product.next_purchase.nil? ? (Date.today + @list_product.frequency) : @list_product.next_purchase
    # respond_to do |format|
    #   format.html { redirect_to_list_product_path }
    #   format.text { render partial: "/", locals: {list_product: @list_product}, formats: [:html] }
    # end
    if @list_product.save
      redirect_to list_path(@list), notice: 'Your list product was successfully created.'
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
    params.require(:list_product).permit(:frequency, :next_purchase, :list_id, :product_id, :user_id)
  end
end
