class Connection < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  attr_accessible :lat, :long
  belongs_to :user
  
end