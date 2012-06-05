class GroupTabBarController < UITabBarController
  def initWith(group)
    self.navigationItem.title = group["name"]
    info_controller = InfoController.alloc.initWith(group["info"])
    self.viewControllers = [info_controller, UIViewController.alloc.init]
    self.selectedIndex = 0
    init()
  end
end
