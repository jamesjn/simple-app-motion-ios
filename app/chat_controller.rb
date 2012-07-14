class ChatController< UIViewController
  
  def init
    start_socketio
    chat_textview = create_chat_textview
    view.addSubview(chat_textview)
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Chat', image:UIImage.imageNamed('star.png'), tag:1)
    super
  end

  def viewDidLoad
  end

  def create_chat_textview
    chat_textview = UITextView.new
    chat_textview.font = UIFont.systemFontOfSize(15)
    chat_textview.textColor = UIColor.whiteColor
    chat_textview.editable = false
    chat_textview.text = "chat goes here"
    chat_textview.backgroundColor = UIColor.clearColor
    chat_textview.frame = [[0,0], [400, 400]]
    chat_textview
  end

  def start_socketio
    @socketIO = SocketIO.alloc.initWithDelegate(self)
    @socketIO.connectToHost("jamesjn.com", onPort:8080);
    @socketIO.sendEvent("join", withData:{name: "iphone"})
    @socketIO.sendEvent("message", withData: {message: "hello world"})
  end

  def socketIO(socket, didReceiveMessage:packet)
    p packet.data
  end

end
