class Item < ActiveRecord::Base

  attr_accessible :name, :price, :bill

  belongs_to :user
  belongs_to :bill

  accepts_nested_attributes_for :bill

end
