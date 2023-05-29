class LinksController < ApplicationController
  def new; end

  def create
    original_url = link_params["original_url"]
    @link = Link.find_by(original_url: original_url)

    if @link.nil?
      slug = SecureRandom.alphanumeric(5)
      @link = Link.create(original_url: original_url, slug: slug)
    end

  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
