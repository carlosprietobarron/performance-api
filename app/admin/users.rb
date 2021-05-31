# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :password, :role

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :email
      f.input :role
      f.input :password
    end
    f.actions
  end
end
