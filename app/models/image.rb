# .frozen
class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  belongs_to :book, optional: true
end
