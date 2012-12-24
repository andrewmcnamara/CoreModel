class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)
    zaThing = Thing.new_entity do |b|
      b.name = "milky"
    end
    p zaThing
    true
  end
end
