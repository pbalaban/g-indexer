class DomainsController < ApplicationController
  before_action :find_domains, only: :index

  def index
    @domain  = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)

    if @domain.save
      redirect_to root_path
    else
      find_domains
      render :index
    end
  end

  private
  def domain_params
    params.require(:domain).permit(:url, :indexed)
  end

  def find_domains
    @domains = Domain.order(updated_at: :desc).load
  end
end