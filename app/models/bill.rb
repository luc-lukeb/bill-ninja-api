class Bill < ActiveRecord::Base

  attr_accessible :name, :user

  belongs_to :user
  has_many :items, :dependent => :destroy

end
