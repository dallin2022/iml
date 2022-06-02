# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  first_name :text
#  image      :string
#  last_name  :text
#  phone      :string
#  tagline    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :phone, length: { is: 10 }
  validates :phone, format: { without: /\A[a-zA-Z]+\z/, message: "only allows numbers" }
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

end
