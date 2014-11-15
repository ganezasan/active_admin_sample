class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :admin_role_assigns
  has_many :admin_roles, through: :admin_role_assigns

  def display_name
    self.email
  end

end
