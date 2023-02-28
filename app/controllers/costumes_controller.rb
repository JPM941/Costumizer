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
    if @costume.save

      redirect_to costumes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @costume = set_costume
    @costume.destroy
    redirect_to costumes_url, notice: "custume was successfully destroyed."
  end

  def edit
    @costume = set_costume
  end

  def update
    @costume = set_costume
    if @costume.update(costume_params)
      redirect_to @costume, notice: "costume was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:name, :price, :description, :image)
  end
end
