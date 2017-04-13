class OrdersController < ApplicationController
  layout "order"
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order(:create_time).page params[:page]
    @order_all = Order.all.count
    @dispatch_all = Order.where("status='网点已派工'").count
    @undispatch_all = Order.where("status='待网点派工'").count
  end

  # POST /orders/import
  def import
    Order.import(params[:file])
    redirect_to orders_url, notice: 'Order was successfully created.'
  end

  # GET /orders/baidu_map
  def baidu_map
    # @orders = Order.all.where(installation_date: Date.today)
    @orders = Order.order(address: :asc)
    @teams = Team.order(name: :asc)
    @order_all = Order.all.count
    @dispatch_all = Order.where("status='网点已派工'").count
    @undispatch_all = Order.where("status='待网点派工'").count
    respond_to :html, :json
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_all = Order.all.count
    @dispatch_all = Order.where("status='网点已派工'").count
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order_all = Order.all.count
    @dispatch_all = Order.where("status='网点已派工'").count
  end

  def dispatch_list
    @orders = Order.where("status = '网点已派工'").order(team_name: :asc).page params[:page]
    @order_all = Order.all.count
    @dispatch_all = Order.where("status='网点已派工'").count
    @undispatch_all = Order.where("status='待网点派工'").count
    respond_to :html, :json

    render layout: "print"
  end

  # def dispatch
  #   @order = Order.find(:id).first
  #   render layout: "print"
  # end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order_import])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params

    # t.datetime :dispatch_time #派工时间
    # t.datetime :recall_time #回访时间
    # t.stirng :recall_note #回访记录
    # t.string :team_name #安装工名称
    # t.string :team_phone #安装工电话
    params.require(:order).permit(:info_no, :lading_no, :create_time, :customer, :area_code, :phone, :province, :city,
                                  :county, :street, :address, :category, :count, :uncount, :purchase_date, :customer_attribute,
                                  :sale_type, :sale_no, :sale_name, :expected_time, :create_network_no, :create_network,
                                  :service_date, :service_network_no, :service_network, :status, :note, :other_note,
                                  :finished_time, :item_type, :item_count, :item_price, :item_type2, :item_count2, :item_price2,
                                  :item_type3, :item_count3, :item_price3, :team_name)
  end
end
