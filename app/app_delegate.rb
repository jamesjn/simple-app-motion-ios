class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    group_list_controller = GroupListController.alloc.init
    @window.rootViewController = group_list_controller
    @window.makeKeyAndVisible
    true
  end
end
