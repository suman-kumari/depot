class Address < ActiveRecord::Base
  belongs_to :user
  validates :street_name, :city, :state, :country, :presence => true
  validates :zipcode, length: { is: 6}
end
