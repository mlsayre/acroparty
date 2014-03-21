class UpdatesController < ApplicationController

  def create
    Update.create(params[:update])
    render :nothing => true
  end

  def destroy
    @updates = Update.all
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to foyer_path, notice: "Post was deleted." }
      format.json { head :no_content }
    end
  end
end
