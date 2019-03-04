class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :reviewer
end
