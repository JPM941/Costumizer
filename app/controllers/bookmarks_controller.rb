class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.create(user: current_user, costume: Costume.find(params[:costume_id]))
    authorize @bookmark
    redirect_to costume_path(@bookmark.costume), notice: "#{@bookmark.costume.name} a été ajouté à vos favoris !"
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to costume_path
  end
  private

  def bookmark_params
    params.require(:bookmark).permit(:costume_id)
  end
end
