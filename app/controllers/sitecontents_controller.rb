class SitecontentsController < ApplicationController

  def index
  end

  def update
    @sitecontent = Sitecontent.first

    respond_to do |format|
      if @sitecontent.update(sitecontent_params)
        format.html { redirect_to account_url(@sitecontent), notice: "Site was successfully updated." }
        format.json { render :show, status: :ok, location: @sitecontent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sitecontent.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def sitecontent_params
      params.require(:sitecontent).permit(:title_site, :subtitle_site, :description_site, :text_rc, :headimg, :columnimg)
    end
end
  