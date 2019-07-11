class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    render json: @report
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new
    @report.save
    if @report.errors.empty?
      render :index
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update(update_params)
    @report.save
    if @report.errors.empty?
      render :index
    else
      flash[:error] = 'Failed to edit report!'
      render json: { errors: @report.errors }, status: :forbiddden
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.delete
      flash[:notice] = 'Persona deleted!'
      head :no_content
      render :index
    else
      flash[:error] = 'Failed to delete this report!'
      render :destroy
    end
  end

  def create_params
    params.permit(:name, :pv, :pa)
  end

  def update_params
    params.require(:reports).permit(:name, :pv, :pa)
  end
end
