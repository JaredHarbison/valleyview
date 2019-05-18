class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :category_id, :user_id
  belongs_to :user
end
