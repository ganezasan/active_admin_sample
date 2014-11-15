class CreateAdminRoleAssigns < ActiveRecord::Migration
  def migrate(direction)
    super
    # migrate時に初期管理ユーザにsuper_admin権限を付与
    AdminRoleAssign.create!(admin_role_id: AdminRole.first.id, admin_user_id: AdminUser.first.id) if direction == :up
  end

  def change
    create_table :admin_role_assigns do |t|
      t.integer :admin_role_id
      t.integer :admin_user_id

      t.timestamps
    end

    add_index(:admin_role_assigns, :admin_role_id, { :name => :index_admin_role_assigns_on_admin_role_id })
    add_index(:admin_role_assigns, :admin_user_id, { :name => :index_admin_role_assigns_on_admin_user_id })
  end
end
