describe "ManagedObjectModel" do

  #before do
  #  model = NSManagedObjectModel.alloc.init
  #  model.entities = ManagedObjectClasses.collect {|c| c.entity}
  #  model.entities.each {|entity| entity.wireRelationships}
  #
  #  store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
  #  store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', DB))
  #  p store_url.path
  #  error_ptr = Pointer.new(:object)
  #  unless store.addPersistentStoreWithType(NSInMemoryStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
  #    raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
  #  end
  #
  #  context = NSManagedObjectContext.alloc.init
  #  context.persistentStoreCoordinator = store
  #  @context = context
  #end
  #bundles = [NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]];
  #NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:bundles];
  #STAssertNotNil(mom, @"ManangedObjectModel ist nil");
  #
  #NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
  #STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
  #
  #self.context = [[NSManagedObjectContext alloc] init];
  #self.context.persistentStoreCoordinator = psc;
  #before do
  #  p self.class
  #  p "ioi"
  #  bundles = NSArray.arrayWithObject(NSBundle.bundleForClass(AppDelegate.class))
  #  p bundles
  #  p "2"
  #  model = NSManagedObjectModel.mergedModelFromBundles(bundles)
  #  p "3"
  #  store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(nil)
  #  ##(model)
  #  p "4"
  #    context = NSManagedObjectContext.alloc.init
  #p "5"
  #    context.persistentStoreCoordinator = store
  #end

  #it "should build a managed object model using registered classes" do
  #  p "hey there"
  #  #ManagedObjectModel
  #  #ManagedObjectModel.build
  #end

end