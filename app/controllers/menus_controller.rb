require 'logwrapper'

class MenusController < ApplicationController
	before_action :authorize_admin, only: [:new, :edit, :update, :destroy]
	before_action :set_menu, only: %i[show edit update destroy]

  # GET /menus or /menus.json
  def index
    @menus = Menu.all
    logs = Logwrapper::Logger.new($stdout)
    logs.info('New menu!', extras:{request_id:"#{request.request_id}"})
  end

  # GET /menus/1 or /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    logs = Logwrapper::Logger.new($stdout)
    logs.info('New menu!', extras:{request_id:"#{request.request_id}"})
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    logs = Logwrapper::Logger.new($stdout)
    respond_to do |format|
      if @menu.save
        logs.info('Menu created!', extras:{request_id:"#{request.request_id}"})
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @menu }
      else
        logs.error('Menu has unprocessable entity!', extras:{request_id:"#{request.request_id}"})
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:name, :description, :price, :category_ids => [])
    end
end
