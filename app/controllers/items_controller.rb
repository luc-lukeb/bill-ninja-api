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

    unless params[:items].nil?
      params[:items].each do |item|
        @item = Item.new
        @item.name = item[:name]
        @item.bill = @bill
        @item.save
      end
    end
  end

end
