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

    def save
      error_ptr = Pointer.new(:object)
      unless @context.save(error_ptr)
        raise "Error when saving the model: #{error_ptr[0].description}"
      end
    end

    private
    def self.entities
      @entities
    end

    def initialize
      # Create the model programmatically. The data will be stored in a SQLite database, inside the application's Documents folder.
      #model.entities.each { |entity| entity.wireRelationships }
      model = NSManagedObjectModel.alloc.init
      model.entities = Store.entities.map { |entity_class| entity_class.entity }
      model.entities.each { |entity| entity.wireRelationships }
      store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
      store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', DB))
      NSLog("Using path #{store_url.path}")
      error_ptr = Pointer.new(:object)
      #TODO find a way to define whether we want a memory or disk store
      #unless store.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: error_ptr)
      #  raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
      #end
      #Migrations are not handled - How?
      options = {"NSMigratePersistentStoresAutomaticallyOption"=>NSNumber.numberWithBool(true), "NSInferMappingModelAutomaticallyOption"=>NSNumber.numberWithBool(true)}
      unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: store_url, options: options, error: error_ptr)
        raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
      end
      context = NSManagedObjectContext.alloc.init
      context.persistentStoreCoordinator = store
      @context = context
    end

    def build_model

    end
  end
end