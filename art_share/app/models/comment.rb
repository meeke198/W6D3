# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  commenter_id :integer          not null
#  artwork_id   :integer          not null
#  body         :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Comment < ApplicationRecord
  validates :commenter_id, :artwork_id, :body, presence: true

  belongs_to :commenter,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: :User

  belongs_to :artwork_id,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
