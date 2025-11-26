ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin

  index do
    selectable_column
    id_column
    column :email
    column :admin
    column :created_at
    actions
  end

  filter :email
  filter :admin
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      if f.object.new_record?
        f.input :password, input_html: { value: '' }
        f.input :password_confirmation, input_html: { value: '' }
      end
      f.input :admin
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      super
    end
  end

  show do
    attributes_table do
      row :id
      row :email
      row :admin
      row :created_at
      row :updated_at
    end
  end
end
