class AdminRoleAssign < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :admin_role
end
