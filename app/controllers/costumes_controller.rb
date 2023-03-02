class CostumesController < ApplicationController
  before_action :set_costume, only: %i[show destroy edit update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @costumes = policy_scope(Costume)
    authorize @costumes
    if params[:query]
      @costumes = Costume.search_by_name_and_description("#{params[:query]}")
      @costumes = @costumes.reject { |costume| costume.user == current_user }
    else
      @costumes = Costume.all
    end

    @costumes = Costume.all if @costumes.empty?
  end

  def show
    authorize @costume
    @costumes = []
    @costumes << @costume
    @markers = [
      {
        lat: @costume.geocode[0],
        lng: @costume.geocode[1],
        marker_html: render_to_string(partial: "marker")
      }
    ]
  end

  def new
    @costume = Costume.new
    authorize @costume
    @costume.user = current_user
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    @costume.address = @costume.user.address
    authorize @costume
    # attacher une image ? se fait dans les params
    if @costume.save
      redirect_to costumes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @costume
    @costume.destroy
    redirect_to costumes_url, notice: "costume was successfully destroyed."
  end

  def edit
    authorize @costume
  end

  def update
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
    params.require(:costume).permit(:name, :price, :description, :address, images: [], query:)
  end
end
