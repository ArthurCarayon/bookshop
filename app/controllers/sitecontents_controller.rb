class SitecontentsController < ApplicationController
  def update
    @sitecontent = Sitecontent.first

    if @sitecontent.update(sitecontent_params)
      redirect_to account_path(current_user), notice: t('general.site_updated')
    else
      redirect_to account_path(current_user), alert: @sitecontent.errors.full_messages.to_sentence
    end
  end

  def create
    @sitecontent = Sitecontent.new(sitecontent_params)

    respond_to do |format|
      if @sitecontent.save
        format.html { redirect_to account_path(current_user), notice: 'Site mise a jour' }
        format.json { render :show, status: :created, location: @sitecontent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sitecontent.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def sitecontent_params
    params.require(:sitecontent).permit(:title_site, :subtitle_site, :description_site, :text_rc, :headimg,
                                        :columnimg)
  end
end
