class Track
  include Mongoid::Document
  field :name, type: String
  field :artist, type: String
  field :image, type: String
  field :preview, type: String
  field :spotify_id, type: String
end
