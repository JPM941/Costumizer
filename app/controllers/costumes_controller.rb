class CostumesController < ApplicationController
  before_action :set_costume, only: %i[show]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @costumes = policy_scope(Costume)
    authorize @costumes
  end

  def show
    authorize @costume
  end

  def new
    @costume = Costume.new
    authorize @costume
    @costume.user = current_user
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    authorize @costume
    # attacher une image ?
    if @costume.save
      redirect_to costumes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @costume = set_costume
    authorize @costume
    @costume.destroy
    redirect_to costumes_url, notice: "custume was successfully destroyed."
  end

  def edit
    @costume = set_costume
  end

  def update
    @costume = set_costume
    authorize @costume
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
