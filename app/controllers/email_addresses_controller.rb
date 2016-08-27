class EmailAddressesController < ApplicationController
  before_action :find_email_addresss, only: :index

  def index
    @email_address  = EmailAddress.new
  end

  def create
    @email_address = EmailAddress.new(email_address_params)

    if @email_address.save
      redirect_to email_addresses_path
    else
      find_email_addresss
      render :index
    end
  end

  def destroy
    @email_address = EmailAddress.find(params[:id])
    @email_address.destroy

    redirect_to email_addresses_path
  end

  private
  def email_address_params
    params.require(:email_address).permit(
      :email, :send_backlink_change, :send_google_index_change
    )
  end

  def find_email_addresss
    @email_addresses = EmailAddress.order(:email).load
  end
end
