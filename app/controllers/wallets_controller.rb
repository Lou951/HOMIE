class WalletsController < ApplicationController

  def wallet
    @purchases = Purchase.where(user_id: current_user)
  end

end
