class InfoController < UIViewController

  def initWith(info)
    info_textview = create_info_textview(info)
    view.addSubview(info_textview)
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Info', image:UIImage.imageNamed('star.png'), tag:1)
    #self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed("steel-mesh.png"))
    init
  end

  def create_info_textview(info)
    info_textview = UITextView.new
    info_textview.font = UIFont.systemFontOfSize(15)
    info_textview.textColor = UIColor.whiteColor
    info_textview.editable = false
    info_textview.text = info
    info_textview.backgroundColor = UIColor.clearColor
    info_textview.frame = [[0,0], [400, 400]]
    info_textview
  end
end
