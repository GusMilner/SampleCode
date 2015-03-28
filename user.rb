class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  attr_accessor :profile, :user_id

  has_one :profile
  

  after_create :create_profile

  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, 
         :trackable, :validatable

  validates :name, presence: true

  

private
  def create_profile
    self.profile = Profile.create(user_id: id)
  end

	
end
