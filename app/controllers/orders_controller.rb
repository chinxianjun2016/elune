class OrdersController < ApplicationController
  layout "order"
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    # @orders = Order.where("status = '待网点派工'").order(create_time: :asc).page params[:page]
    @orders = Order.where("status = '待网点派工'").order(create_time: :asc)

    @undispatch_all = Order.where("status = '待网点派工'").count
    @dispatching_all = Order.where("install_date='#{Date.tomorrow}'").count
    @dispatched_all = Order.where("status='网点已派工'").count
    @finished_all = Order.where("status='派工已完工'").count

    respond_to :html, :json

  end

  # POST /orders/import
  def import
    Order.import(params[:file])
    redirect_to orders_url, notice: 'Order was successfully created.'
  end

  # GET /orders/baidu_map
  def baidu_map
    # @orders = Order.order(address: :asc)

    @orders = Order.where(install_date: Date.tomorrow)
    @teams = Team.order(name: :asc)

    @undispatch_all = Order.where("status='待网点派工'").count
    @dispatched_all = Order.where("status='网点已派工'").count
    @dispatching_all = @orders.count
    @finished_all = Order.where("status='派工已完工'").count
    respond_to :html, :json

    render layout: "ordersemantic"
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
  end

  def dispatch_list
    # @orders = Order.where("status = '网点已派工'").order(team_name: :asc).page params[:page]
    @orders = Order.where("status = '网点已派工'").order(team_name: :asc)
    @undispatch_all = Order.where("status='待网点派工'").count
    @dispatching_all = Order.where("install_date='#{Date.tomorrow}'").count
    @dispatched_all = @orders.count
    @finished_all = Order.where("status='派工已完工'").count
    respond_to :html, :json

    render layout: "print"
  end

  def finished_list
    @orders = Order.where("status = '派工已完工'").order(:install_date)
    @undispatch_all = Order.where("status='待网点派工'").count
    @dispatching_all = Order.where("install_date='#{Date.tomorrow}'").count
    @dispatched_all = Order.where("status='派工已派工'").count
    @finished_all = @orders.count
    respond_to :html, :json

    # render layout: "ordersemantic"
  end

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

    unless params["order"]
      if (params["name"] && params["value"])
        params["order"] = { "#{params['name']}":params['value']  }
      end
    end

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

    params.require(:order).permit(:info_no, :lading_no, :create_time, :customer, :area_code, :phone, :province, :city,
                                  :county, :street, :address, :category, :count, :uncount, :purchase_date, :customer_attribute,
                                  :sale_type, :sale_no, :sale_name, :expected_time, :create_network_no, :create_network,
                                  :service_date, :service_network_no, :service_network, :status, :note, :other_note,
                                  :finished_time, :item_type, :item_count, :item_price, :item_type2, :item_count2, :item_price2,
                                  :item_type3, :item_count3, :item_price3, :team_name, :install_date, :operator, :dispatch_time,
                                  :recall_time, :recall_note)
  end
end
