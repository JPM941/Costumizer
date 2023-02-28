class CostumesController < ApplicationController
  before_action :set_costume, only: %i[show]

  def index
    @costumes = Costume.all
  end

  def show
  end

  def new
    @costume = Costume.new
    @costume.user = current_user
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    # attacher une image ?
    if @costume.save
      redirect_to costumes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:name, :price, :description)
  end
end
