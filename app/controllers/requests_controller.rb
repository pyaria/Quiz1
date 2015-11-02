class RequestsController < ApplicationController
  def index
    requests = Request.all
    @done = []
    @notdone = []
    if params[:search]
      @rsearch = Request.search(params[:search])
    else
      requests.each do |request|
        if request.done
          @done.push(request)
        else
          @notdone.push(request)
        end
      end
    end
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

  def donetond
    request = Request.find(params[:id])
    request.update_attribute(:done, false)
    redirect_to root_path, notice: "Request marked as not done"
  end
  def ndtodone
    request = Request.find(params[:id])
    request.update_attribute(:done, true)
    redirect_to root_path, notice: "Request marked as done"
  end
end
