class ItemsController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])

    params[:items].each do |item|
      item = @bill.items.create(item)
    end
  end

end
