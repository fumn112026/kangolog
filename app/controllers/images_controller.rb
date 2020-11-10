class ImagesController < ApplicationController

  def create
    Image.create(image_params)
  end

  private
  def image_params
    params.require(:image).permit(:url).merge(article_id: params[:article_id])
  end
end
