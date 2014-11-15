class CreateAdminRoles < ActiveRecord::Migration
  def migrate(direction)
    super
    # migrate時にsuper_admin権限を追加
    AdminRole.create!(name: 'super_admin') if direction == :up
  end
  
  def change
    create_table :admin_roles do |t|
      t.string :name
      t.timestamps
    end
  end
end
