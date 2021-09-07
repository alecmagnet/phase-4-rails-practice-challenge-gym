class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_total

  def membership_total
    self.object.memberships.sum(:charge)
  end
end