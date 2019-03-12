class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :contact, :current_project, :skills
end
