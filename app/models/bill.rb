class Bill < ActiveRecord::Base

  attr_accessible :title, :user

  belongs_to :user
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :reject_if => proc { |attributes| attributes['title'].blank? or attributes['price'].blank? }

end
