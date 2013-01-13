module CoreModel::CoreRelationshipDescription
  attr_accessor :destinationEntityName, :inverseRelationshipName
end

class NSRelationshipDescription
  include CoreModel::CoreRelationshipDescription
end
