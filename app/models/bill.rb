class Bill < ActiveRecord::Base

  attr_accessible :name, :user, :title

  belongs_to :user
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :reject_if => proc { |attributes| attributes['name'].blank? or attributes['price'].blank? }

end
