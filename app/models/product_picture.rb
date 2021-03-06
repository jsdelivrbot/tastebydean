# == Schema Information
#
# Table name: product_pictures
#
#  id         :integer          not null, primary key
#  product_id :integer
#  main       :boolean          default("false")
#  activated  :boolean          default("true")
#  image      :text
#
# Indexes
#
#  index_product_pictures_on_product_id  (product_id)
#

class ProductPicture < ApplicationRecord
	belongs_to :product
	before_destroy :destroy_assets
	mount_uploader :image, ProductPictureUploader
	validate :image_size_validation

# ---------------- Scopes -------------------------------------------------------------------------

	scope :active, -> { where activated: true }
	scope :main, -> { where main: true }

# ---------------- Options & functions -----------------------------------------------------------------------------

	private

	def image_size_validation
		errors[:image] << "should be less than 10MB" if image.size > 10.megabytes
	end

	def destroy_assets
		self.image.remove! if self.image
		self.save!
	end

end
