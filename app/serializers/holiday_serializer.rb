class HolidaySerializer < ActiveModel::Serializer
  attributes :id, :user_name, :start_at, :end_at

  def user_name
    object.user&.full_name
  end
end
