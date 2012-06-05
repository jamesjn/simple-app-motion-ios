class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    group_list_controller = GroupListController.alloc.init
    group_nav_controller = UINavigationController.alloc.initWithRootViewController(group_list_controller)
    @window.rootViewController = group_nav_controller
    @window.makeKeyAndVisible
    true
  end
end
