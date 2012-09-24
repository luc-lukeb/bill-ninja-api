class User < ActiveRecord::Base

  attr_accessible :email, :name

  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {
                      :with => %r{^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$},
                      :message => "You must enter a valid email address."
                    }
  validates :name,  :presence => true

  has_many :bills

end
