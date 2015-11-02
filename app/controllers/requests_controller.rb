class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(params.require(:request).permit([:name, :email, :department, :message]))
    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @r = Request.find(params[:id])
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(params.require(:request).permit([:name, :email, :department, :message]))
    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    redirect_to root_path, notice: "Request deleted successfully"
  end
end
