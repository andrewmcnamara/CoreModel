module CoreModel
  class Store
    DB = 'store.sqlite'
    def self.shared
      @shared ||= Store.new
    end

    def self.register_entity entity_class
      NSLog("Registering #{entity_class}")
      (@entities||=[])<< entity_class
    end

    def context
      @context
    end

    private
    def self.entities
      @entities
    end

    def initialize
      # Create the model programmatically. The data will be stored in a SQLite database, inside the application's Documents folder.
      model = NSManagedObjectModel.alloc.init
      model.entities = Store.entities.map {|entity_class|entity_class.entity}
      #model.entities.each { |entity| entity.wireRelationships }
      store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
      store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', DB))
      NSLog("Using path #{store_url.path}")
      error_ptr = Pointer.new(:object)

      unless store.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: error_ptr)
        raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
      end
      #unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: store_url, options: nil, error: error_ptr)
      #  raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
      #end
      context = NSManagedObjectContext.alloc.init
      context.persistentStoreCoordinator = store
      @context = context
    end
  end
end