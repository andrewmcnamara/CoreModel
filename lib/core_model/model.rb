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
        yield NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext:Store.shared.context)
      end
      #
      #def initialize
      #  # Create the model programmatically. The data will be stored in a SQLite database, inside the application's Documents folder.
      #  model = NSManagedObjectModel.alloc.init
      #  model.entities = ManagedObjectClasses.collect {|c| c.entity}
      #  model.entities.each {|entity| entity.wireRelationships}
      #
      #  store = .alloc.initWithManagedObjectModel(model)
      #  store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', DB))
      #  p store_url.path
      #  error_ptr = Pointer.new(:object)
      #  unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
      #    raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
      #  end
      #
      #  context = NSManagedObjectContext.alloc.init
      #  context.persistentStoreCoordinator = store
      #  @context = context
      #end


    end

  end

end