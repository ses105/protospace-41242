class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_name, :user_id

  def user_name
    object.user.name
  end

  def user_id
    object.user.id
  end
end
