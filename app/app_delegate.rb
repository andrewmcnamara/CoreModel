class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)

      zaMagicChest = MagicChest.new_entity do |mc|
        mc.name = "The magic happens here"
        mc
        
      end
      CoreModel::Store.shared.save
      p zaMagicChest
      #zaMagicChest.add
      #
      zaThing = Thing.new_entity do |b|
        b.name = "milky"
        b.magic_chest = zaMagicChest
      end
      #zaThing.save
      #p zaThing
      CoreModel::Store.shared.save
      #mc.


      #
      #bs =  BirdSighting.add do |bird_sighting|
      #  bird_sighting.bird = bird #NSOrderedSet.alloc.initWithObject(bird)
      #  bird_sighting.name = bird.species_english_name
      #  bird_sighting.timestamp = NSDate.date
      #  bird_sighting.checklist = checklist
      #end
      #checklist.bird_count+=1
      #checklist.update

    true
  end
end
