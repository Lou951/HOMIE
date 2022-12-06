class WalletsController < ApplicationController

  def wallet
    @purchases = Purchase.where(user_id: current_user).where(created_at: (Date.today - 2.month))
  end

end
