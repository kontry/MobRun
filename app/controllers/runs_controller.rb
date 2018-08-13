class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :set_route, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @runs = Run.all
  end

  def show
    @run = Run.find(params[:id])
  end

  def new
    #@user = User.find(params[:user_id])
    @route = Route.find(params[:route_id])
    @run = Run.new
  end

  def create
    @run = Run.new(run_params)
    @run.route = Route.find(params[:route_id])

    @route = @run.route
    #complete with the user!!
    #@user = current_user

    if @run.save
      raise
      redirect_to route_path(@route)
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Run.destroy(params[:id])
    redirect_to runs_path
  end

  private

  def run_params
    params.require(:run).permit(:start_time, :end_time)
  end

  def set_run
    @run = Run.find(params[:id])
  end

  def set_route
    @route = Route.find(@run.route_id)
  end

  def set_user
    @user = User.find(@run.user_id)
  end
end
