class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = list_of_users_lists
    @words = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
    @urgent_products = ListProduct.where(next_purchase: Date.today..Date.today + 3.days).order(next_purchase: :asc)
    # @users = User.where.not(id: current_user.id).limit(3)
  end

  def show
    @list = List.find(params[:id])
    @list_product = ListProduct.new
    @list_products = show_list_products(@list)
    @purchases = Purchase.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: 'Your list was successfully created.' }
        format.json
        # format.json { render partial: "lists/list", locals: { list: @list }, formats: [:html] }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Your list was not created.' }
        format.json
      end
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def show_list_products(list)
    @list_products = ListProduct.where(["list_id = #{list.id}"])
    @list_products.order(next_purchase: :asc)
  end

  def list_of_users_lists
    List.where(user_id: current_user) + current_user.lists.select(&:user_lists)
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
