class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :approved
  has_many :contributions
end
