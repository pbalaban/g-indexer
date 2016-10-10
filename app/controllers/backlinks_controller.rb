class BacklinksController < ApplicationController
  before_action :find_backlinks, only: [:index, :edit]
  before_action :find_backlink, only: [:edit, :update]

  def index
    @backlink  = Backlink.new
  end

  def edit
    render :index
  end

  def update
    if @backlink.update(backlink_params)
      redirect_to root_path
    else
      find_backlinks
      render :index
    end
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
    params.require(:backlink).permit(:referrer_page, :referent_domain, :project_id, :expired_at)
  end

  def find_backlinks
    @backlinks = Backlink.order(updated_at: :desc).load
  end

  def find_backlink
    @backlink = Backlink.find(params[:id])
  end
end
