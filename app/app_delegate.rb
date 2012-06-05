class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    group_list_controller = GroupListController.alloc.init
    group_nav_controller = UINavigationController.alloc.initWithRootViewController(group_list_controller)
    group_nav_controller.navigationBar.setBackgroundImage(UIImage.imageNamed("brushedmetal.png"), forBarMetrics:(UIBarMetricsDefault))
    #group_nav_controller.navigationBar.setTitleTextAttributes({UITextAttributeTextColor: UIColor.blackColor, UITextAttributeFont: UIFont.fontWithName("AmericanTypewriter", size:18)})
    @window.rootViewController = group_nav_controller
    @window.makeKeyAndVisible
    true
  end
end
