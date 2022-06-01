# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  first_name :text
#  image      :string
#  last_name  :text
#  tagline    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
end
