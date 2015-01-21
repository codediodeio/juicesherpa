class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

begin
  def soft_user?
    if self.email.empty?
      true
    else
      false
    end
  end

  def full_user?
    unless self.email.empty?
      true
    else
      false
    end
  end
end


end
