class Album < ActiveRecord::Base
  belongs_to :artist
  has_many   :tracks

  validates_presence_of :title, :artist
end
