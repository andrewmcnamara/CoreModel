class Thing < NSManagedObject
  include CoreModel::Model
  attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
  attribute :type, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
  attribute :description, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
  belongs_to :magic_chest
end