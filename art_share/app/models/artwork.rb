# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :artist_id, :image_url, presence: true
    validates :title, presence: true, uniqueness: {scope: :artist_id, message: "an artist only can have one piece with the same title"}

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

end
