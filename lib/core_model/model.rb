module CoreModel
  module Model

    def self.included(base)
      base.extend(ClassMethods)
      Store.register_entity(base)
    end

    module ClassMethods
      def attribute(name, options)
        property = NSAttributeDescription.alloc.init
        property.name = name.to_s
        property.attributeType = options[:type]
        property.defaultValue = options[:default] if options[:default] != nil
        property.optional = options[:optional]
        property.transient = options[:transient]
        property.indexed = options[:indexed]
        (@attributes ||= []) << property
      end

      def entity
        @entity ||= NSEntityDescription.new
        @entity.name = self.to_s
        @entity.managedObjectClassName = self.to_s
        @entity.properties = @attributes + (@relationships||[])
        @entity
      end

      def new_entity
        yield NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext: Store.shared.context)
      end

      def has_many(relationship_name, options={})
        min_count = (options.fetch(:optional, true)) ? 0 : 1
        has_many_options= options.merge(:min_count => min_count, :max_count => NSIntegerMax)
        define_relationship(relationship_name, has_many_options)
      end

      def belongs_to(parent, options={})
        options.merge!({type: parent.to_s.camelize,
                        optional: true,
                        min_count: 0,
                        max_count: 1,
                        inverse_relationship_name: self.name.downcase+"s",
                        delete_rule: NSNullifyDeleteRule
                       })
        define_relationship(parent, options)
      end

      def has_one(relationship_name, options={})
        #TODO implement me
        raise "Implement me"
        min_count = (options.fetch(:optional, true)) ? 0 : 1
        has_one_options= options.merge(:min_count => min_count, :max_count => 1)
        define_relationship(relationship_name, has_one_options)
      end

      def define_relationship(relationship_name, options={})
        property = NSRelationshipDescription.alloc.init
        property.name = relationship_name.to_s
        property.destinationEntityName = options[:type].to_s
        property.inverseRelationshipName = options[:inverse_relationship_name]
        property.optional = options.fetch(:optional, false)
        #property.transient = transient
        property.indexed = options.fetch(:indexed, false)
        property.ordered = options.fetch(:ordered, false)
        property.minCount = options[:min_count]
        property.maxCount = options[:max_count] # NSIntegerMax
        property.deleteRule = options[:delete_rule] # NSNoActionDeleteRule NSNullifyDeleteRule NSCascadeDeleteRule NSDenyDeleteRule
        (@relationships ||= []) << property
      end

      def save
        CoreModel::Store.shared.context.save
      end

    end
  end
end