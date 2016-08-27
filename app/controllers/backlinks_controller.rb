class BacklinksController < ApplicationController
  before_action :find_backlinks, only: :index

  def index
    @backlink  = Backlink.new
  end

  def create
    @backlink = Backlink.new(backlink_params)

    if @backlink.save
      redirect_to root_path
    else
      find_backlinks
      render :index
    end
  end

  def destroy
    @backlink = Backlink.find(params[:id])
    @backlink.destroy

    redirect_to root_path
  end

  private
  def backlink_params
    params.require(:backlink).permit(:referrer_page, :referent_domain)
  end

  def find_backlinks
    @backlinks = Backlink.order(updated_at: :desc).load
  end
end
