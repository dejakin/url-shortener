class LinksController < ApplicationController
  before_action :set_link, only: [:redirect]

  def new; end

  def create
    original_url = link_params["original_url"]
    @link = Link.find_by(original_url: original_url)

    if @link.nil?
      slug = SecureRandom.alphanumeric(5)
      @link = Link.create(original_url: original_url, slug: slug)
    end
  end

  def redirect
    if @link.nil?
      redirect_to root_path
    else
      "https://".in?(@link.original_url) ? redirect_to(@link.original_url) : redirect_to("https://#{@link.original_url}")
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def set_link
    @link = Link.find_by(slug: params["slug"])
  end
end
