module CoreModel::CoreEntityDescription
  def wireRelationships
    entities = self.managedObjectModel.entitiesByName
    self.relationshipsByName.values.flatten.each do |property|
      property.destinationEntity = entities[property.destinationEntityName]
      property.inverseRelationship = property.destinationEntity.relationshipsByName[property.inverseRelationshipName]
    end
  end
end

class NSEntityDescription
  include CoreModel::CoreEntityDescription
end
