class Userlocation < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude, :language  => :ja
  after_validation :reverse_geocode
  geocoded_by :address, :language  => :ja
  after_validation :geocode
end
