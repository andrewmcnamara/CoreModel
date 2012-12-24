class Thing < NSManagedObject
  include CoreModel::Model
  #name, type, default, optional, transient, indexed
  attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
  attribute :type, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
  attribute :description, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
end