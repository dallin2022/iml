# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  ae_name    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Video < ApplicationRecord
end
