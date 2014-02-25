class Lecture < ActiveRecord::Base
  validates :name, :presence => true
  validates :code, :presence => true
  validates :semester, :presence => true
  validates :professor, :presence =>true

  has_many :comments
end
