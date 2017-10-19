# .frozen
class Image < ApplicationRecord
  mount_uploader :file, ImageUploader
  belongs_to :book, optional: true
end
