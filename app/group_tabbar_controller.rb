class GroupTabBarController < UITabBarController
  def initWith(group)
    self.navigationItem.title = group["name"]
    info_controller = InfoController.alloc.initWith(group["info"])
    self.viewControllers = [info_controller, UIViewController.alloc.init]
    self.selectedIndex = 0
    self.tabBar.setBackgroundImage(UIImage.imageNamed("tabbar-bg.png"))
    self.tabBar.setSelectionIndicatorImage(UIImage.imageNamed("tabbar-selection.png").resizableImageWithCapInsets(UIEdgeInsetsMake(12,12,12,12)))
    init()
  end
end
