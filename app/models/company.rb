class Company < ActiveRecord::Base
  validates :name, :location, :mail, :phone, presence:true
  has_many :jobs

end
