class VendorSweetsController < ApplicationController

  # Used for testing purposes
  # def index
  #   render json: VendorSweet.all
  # end

  def create
    vendor_sweets = VendorSweet.create(vendor_sweets_params)
    if (vendor_sweets.valid?)
      render json: vendor_sweets
    else
      render json: {errors: vendor_sweets.errors.full_messages}, status: 422
    end
  end

  def destroy
    vendor_sweets = VendorSweet.find_by(id: params[:id])
    if (vendor_sweets)
      vendor_sweets.destroy
      render json: {}
    else
      render json: {error: "VendorSweet not found"}, status: 422
    end
  end

  private

  def vendor_sweets_params
    params.permit(:price, :vendor_id, :sweet_id)
  end
end
