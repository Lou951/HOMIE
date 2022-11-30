class PurchasesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_list_product, only: %i[new create]

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new
    @purchase.list_product = @list_product
    @purchase.purchase_date = Date.today
    @purchase.user = @user
    if @purchase.save
      redirect_to list_path(@list_product.list.id), notice: 'Your purchases was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'The purchase was not added to the list.'
    end
  end

  private

  def set_list_product
    @list_product = ListProduct.find(params[:list_product_id])
  end

  def set_user
    @user = current_user
  end
end