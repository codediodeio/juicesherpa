class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  # Search Method

  def self.search(params)
    where("name ILIKE ?", "%#{params[:keyword]}%")
  end



  # Method to return type of user, soft or full
  def type_of_user
    if self.user_id.present?
       "Full User: #{self.user.email}"
     else
       "Soft User"
    end
  end

end
