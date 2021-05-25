# rubocop:disable Layout/LineLength
class DealsController < ApplicationController
  def index
    @deals = if params['solo']
    Deal.where(author: current_user).includes(:deals_groups).where(deals_groups: { id: nil }).includes([:groups])
    else
    Deal.where(author: current_user).includes(:deals_groups).where.not(deals_groups: { id: nil })
    end
  end

  
  def deal_params
    params.require(:deal).permit(:title, :amount, :author, :group)
  end
end
# rubocop:enable Layout/LineLength