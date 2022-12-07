class PurchasesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_list_product, only: %i[new create]

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.list_product = @list_product
    @purchase.purchase_date = Date.today
    @purchase.user = @user
    @list_product.next_purchase = Date.today + rand(10..35)
    @list_product.save
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

  def purchase_params
    params.require(:purchase).permit(:price_paid, :product_id, :user_id)
  end
end
