#CoreModel
This gem provides a way of building core data models through a simple Ruby DSL. Based on the core relationship sample from [https://github.com/caramdache/games](https://github.com/caramdache/games)
Don
##Example Usage
###Simple Model
    class Thing < NSManagedObject
      include CoreModel::Model
      attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
      attribute :type, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
      attribute :description, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
    end

###Defining Relationships
####1 to Many

    class MagicChest < NSManagedObject
      include CoreModel::Model
      attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
      has_many :things, :type => Thing, :inverse_relationship_name => "magic_chest", :delete_rule => NSCascadeDeleteRule
    end
-
    class Thing < NSManagedObject
      include CoreModel::Model
      attribute :name, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
      attribute :type, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
      attribute :description, :type => NSStringAttributeType, :default => '', :optional => false, :transient => false, :indexed => true
      belongs_to :magic_chest
    end
    

## Todo

- Handle other relationship types (has_one etc)
- A defaults based on the type
- Provide a nicer syntax for persisting
- Provide an abstraction for return NSEntityDescription
- Handle migrations
- Provide abstraction to specify whether we will use an in memory or disk store see [NanoStoreInMotion - Set default store	](https://github.com/siuying/NanoStoreInMotion) 