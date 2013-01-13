class MagicChest < NSManagedObject
  include CoreModel::Model
  attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
  has_many :things, :type => Thing, :inverse_relationship_name => "magic_chest", :delete_rule => NSCascadeDeleteRule
end