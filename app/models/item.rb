class Item < ActiveRecord::Base

  attr_accessible :name, :price

  belongs_to :user
  belongs_to :bill

end
