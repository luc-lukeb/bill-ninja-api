class ItemsController < ApplicationController

  def index
    @bill = Bill.find(params[:bill_id])
    @items = @bill.items.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def create
    @bill = Bill.find(params[:bill_id])

    params[:items].each do |item|
      item = @bill.items.create(item)
    end
  end

end
