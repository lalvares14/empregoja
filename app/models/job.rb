class Job < ActiveRecord::Base

  validates :title, :category, :description, :location, presence: true
  belongs_to :company
end
