class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  before_save { self.role ||= :standard }
  
  enum role: [:standard, :premium, :admin]
end
