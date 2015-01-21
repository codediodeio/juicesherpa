class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

  # Tests if User is unregisted by checking if email is empty
  def soft_user?
    if self.email.empty?
      true
    else
      false
    end
  end

  # Tests if user is registed by making sure email address is not empty
  def full_user?
    unless self.email.empty?
      true
    else
      false
    end
  end

  def needs_engagement?
    recipes = Recipe.where(soft_user_token: self.soft_user_token)
    if self.soft_user? && recipes.count > 2
      true
    end
  end



end
