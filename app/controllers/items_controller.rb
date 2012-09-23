class ItemsController < ApplicationController

  # GET /bills/1/items
  # GET /bills/1/items.json
  def index
    @bill = Bill.find params[:bill_id]
    @items = @bill.items.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /bills/1/items/1
  # GET /bills/1/items/1.json
  def show
    @bill = Bill.find params[:bill_id]
    @item = @bill.items.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill.to_json(:include => :items) }
    end
  end

  # GET /bills/1/items/new
  # GET /bills/1/items/new.json
  def new
    @bill = Bill.find params[:bill_id]
    @item = Item.new
    @item.bill = @bill

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /bills/1/items/1/edit
  def edit
    @bill = Bill.find params[:bill_id]
    @item = @bill.items.find params[:id]
  end

  # POST /bills/1/items
  # POST /bills/1/items.json
  def create
    @bill = Bill.find params[:bill_id]

    if !params[:items].nil?
      # many records
      records = []

      params[:items].each do |item|
        records.push item.merge({:bill => @bill})
      end

      Item.create records

      redirect_to bill_items_url

    elsif !params[:item].nil?
      # one record

      @item = Item.new params[:item]
      @item.bill = @bill

      respond_to do |format|
        if @item.save
          format.html { redirect_to [@bill, @item], notice: 'Item was successfully created.' }
          format.json { render json: @item, status: :created, location: [@bill, @item] }
        else
          format.html { render action: "new" }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PUT /bills/1/items/1
  # PUT /bills/1/items/1.json
  def update
    @bill = Bill.find params[:bill_id]
    @item = @bill.items.find params[:id]

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to [@bill, @item], notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @items.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1/items/1
  # DELETE /bills/1/items/1.json
  def destroy
    @bill = Bill.find params[:bill_id]
    @item = @bill.items.find params[:id]
    @item.destroy

    respond_to do |format|
      format.html { redirect_to bill_items_url }
      format.json { head :no_content }
    end
  end

end
