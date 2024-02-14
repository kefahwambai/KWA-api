class ContributionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date
  has_one :member
end
