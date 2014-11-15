ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, admin_role_ids: []

  index do
    selectable_column
    id_column
    column :admin_roles do |f|
      f.admin_roles.size > 0 ? f.admin_roles.map { |r| r.name }.join(", ") : ''
    end
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :admin_roles
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin_roles
    end
    f.actions
  end
  # パスワードが空の状態で編集した場合はパスワード更新しないように（can't be blank エラーの防止）
  controller do
    def update
      if params[:admin_user][:password].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end
  end

end
