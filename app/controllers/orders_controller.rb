class OrdersController < ApplicationController
  layout "order"
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if params["like"]
      like = params["like"]
    else
      like = ""
    end
    # @teams = Team.order(name: :asc)

    # if params["sale_name"] != "全部"
    #   sale_name = params["sale_name"]

    @orders = Order.where("lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ? OR team_name LIKE ?
                           OR address LIKE ? OR phone LIKE ? OR note LIKE ?", "%#{like}%", "%#{like}%", "%#{like}%",
                          "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%")
                  .order(phone: :asc).page params[:page]
    # else
    #
    #   @orders = Order.where("lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ? OR team_name LIKE ?
    #                        OR address LIKE ? OR phone LIKE ? OR note LIKE ?", "%#{like}%", "%#{like}%", "%#{like}%",
    #                         "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%")
    #                 .where("status = '待网点派工'")
    #                 .order(create_time: :asc).page params[:page]
    # end

    # @orders = Order.where("status = '待网点派工'").order(create_time: :asc)
    @all = Order.all.count
    @undispatch_all = Order.where("status = '待网点派工'").count
    @dispatching_all = Order.where("install_date='#{Date.tomorrow}'").count
    @dispatched_all = Order.where("status='网点已派工'").count
    @finished_all = Order.where("status='派工已完工'").count

    # bom = Date.today.beginning_of_month
    # eom = Date.today.end_of_month
    # @counts = {}
    #
    # @teams.each do |t|
    #   @counts["#{t.name}"] = Order.where("team_name = ?", t.name).where("status='网点已派工'").where("install_date <= ? and install_date >= ?", eom, bom).count
    # end

    respond_to :html, :json

  end

  def waiting
    if params["like"]
      like = params["like"]
    else
      like = ""
    end
    # @teams = Team.order(name: :asc)

    # if params["sale_name"] != "全部"
    #   sale_name = params["sale_name"]

      @orders = Order.where("lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ? OR team_name LIKE ?
                           OR address LIKE ? OR phone LIKE ? OR note LIKE ?", "%#{like}%", "%#{like}%", "%#{like}%",
                            "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%")
                    .where("status = '待网点派工'")
                    .order(:phone, :address).page params[:page]
    # else
    #
    #   @orders = Order.where("lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ? OR team_name LIKE ?
    #                        OR address LIKE ? OR phone LIKE ? OR note LIKE ?", "%#{like}%", "%#{like}%", "%#{like}%",
    #                         "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%")
    #                 .where("status = '待网点派工'")
    #                 .order(create_time: :asc).page params[:page]
    # end

    # @orders = Order.where("status = '待网点派工'").order(create_time: :asc)

    @all = Order.all.count
    @undispatch_all = Order.where("status = '待网点派工'").count
    @dispatching_all = Order.where("install_date='#{Date.tomorrow}'").count
    @dispatched_all = Order.where("status='网点已派工'").count
    @finished_all = Order.where("status='派工已完工'").count

    # bom = Date.today.beginning_of_month
    # eom = Date.today.end_of_month
    # @counts = {}
    #
    # @teams.each do |t|
    #   @counts["#{t.name}"] = Order.where("team_name = ?", t.name).where("status='网点已派工'").where("install_date <= ? and install_date >= ?", eom, bom).count
    # end

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

    @orders = Order.where(install_date: Date.tomorrow).order(lng: :asc)
    @teams = Team.order(name: :asc)

    @all = Order.all.count
    @undispatch_all = Order.where("status='待网点派工'").count
    @current_all = Order.where(install_date: Date.today).count
    @dispatched_all = Order.where("status='网点已派工'").count
    @dispatching_all = @orders.count
    @finished_all = Order.where("status='派工已完工'").count
    bom = Date.today.beginning_of_month
    eom = Date.today.end_of_month
    @counts = {}
    @teams.each do |t|
      @counts["#{t.name}"] = Order.where("team_name = ?", t.name).where("status='网点已派工'").where("install_date <= ? and install_date >= ?", eom, bom).count
    end

    respond_to :html, :json

    render layout: "ordersemantic"

    # render layout: "order"
  end

  def current
    @orders = Order.where(install_date: Date.today).where("status='网点已派工' OR status='待网点派工'").order(lng: :asc)
    @teams = Team.order(name: :asc)

    @all = Order.all.count
    @undispatch_all = Order.where("status='待网点派工'").count
    @dispatched_all = Order.where("status='网点已派工'").count
    @dispatching_all = Order.where(install_date: Date.tomorrow).count
    @current_all = @orders.count
    @finished_all = Order.where("status='派工已完工'").count
    bom = Date.today.beginning_of_month
    eom = Date.today.end_of_month
    @counts = {}
    @teams.each do |t|
      @counts["#{t.name}"] = Order.where("team_name = ?", t.name).where("status='网点已派工'").where("install_date <= ? and install_date >= ?", eom, bom).count
    end

    respond_to :html, :json

    # render layout: "ordersemantic"

    render layout: "order"
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
    @all = Order.all.count
    @undispatch_all = Order.where("status='待网点派工'").count
    @dispatched_all = Order.where("status='网点已派工'").count
    @dispatching_all = Order.where(install_date: Date.tomorrow).count
    @current_all = Order.where(install_date: Date.today).count
    @finished_all = Order.where("status='派工已完工'").count

    if params["like"]
      like = params["like"]
    else
      like = ""
    end

    unless params["install_date"].blank?
     ins_date = params["install_date"].to_date
    else
     ins_date = Date.tomorrow
    end

    @orders = Order.where("lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ? OR team_name LIKE ?
                           OR address LIKE ? OR phone LIKE ? OR note LIKE ?", "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%",
                          "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%")
                  .where("status = '网点已派工'").where(install_date: ins_date)
                  .order(:team_name, :phone)
                  #.order(team_name: :asc).page params[:page]

    respond_to :html, :json

    render layout: "print"
  end

  def finished_list
    if params["like"]
      like = params["like"]
    else
      like = ""
    end

    @orders = Order.where("lading_no LIKE ? OR customer LIKE ? OR item_type LIKE ? OR sale_name LIKE ?
                           OR address LIKE ? OR phone LIKE ? OR note LIKE ?", "%#{like}%", "%#{like}%", "%#{like}%",
                          "%#{like}%", "%#{like}%", "%#{like}%", "%#{like}%").where("status = '派工已完工'").order(install_date: :asc).page params[:page]

    # @orders = Order.where("status = '派工已完工'").order(:install_date)
    @all = Order.all.count
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
    @order = Order.new(order_params)

    respond_to do |format|
      @order.lng = BaiduMap.geocoder(address: params[:order]["address"])["result"]["location"]["lng"]
      @order.lat = BaiduMap.geocoder(address: params[:order]["address"])["result"]["location"]["lat"]
      @order.status="待网点派工"
      if Order.last
        @order.id = Order.last.id + 1
      end
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

    params.require(:order).permit(:id, :info_no, :lading_no, :create_time, :customer, :area_code, :phone, :province, :city,
                                  :county, :street, :address, :category, :count, :uncount, :purchase_date, :customer_attribute,
                                  :sale_type, :sale_no, :sale_name, :expected_time, :create_network_no, :create_network,
                                  :service_date, :service_network_no, :service_network, :status, :note, :other_note,
                                  :finished_time, :item_type, :item_count, :item_price, :item_type2, :item_count2, :item_price2,
                                  :item_type3, :item_count3, :item_price3, :team_name, :install_date, :operator, :dispatch_time,
                                  :recall_time, :recall_note, :lng, :lat)
  end
end
