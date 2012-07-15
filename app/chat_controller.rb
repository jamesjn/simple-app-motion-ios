class ChatController< UIViewController
  
  def init
    start_socketio
    chat_textview = create_chat_textview
    chat_textfield = create_chat_textfield
    view.addSubview(chat_textview)
    view.addSubview(chat_textfield)
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Chat', image:UIImage.imageNamed('star.png'), tag:1)
    super
  end

  def viewDidLoad
  end

  def create_chat_textfield
    chat_textfield = UITextField.new
    chat_textfield.textColor = UIColor.blackColor
    chat_textfield.text = "please enter text"
    chat_textfield.backgroundColor = UIColor.whiteColor
    chat_textfield.frame = [[0,0], [320,25]]
    chat_textfield.delegate = self
    @chat_textfield = chat_textfield
    chat_textfield
  end

  def textFieldShouldReturn(theTextField)
    if theTextField == @chat_textfield
      @chat_textfield.resignFirstResponder
      msg = @chat_textfield.text
      @chat_textview.text =  msg + "\n" + @chat_textview.text 
      @socketIO.sendEvent("message", withData: {message: msg})
      @chat_textfield.text = ''
    end
    true
  end

  def create_chat_textview
    chat_textview = UITextView.new
    chat_textview.font = UIFont.systemFontOfSize(15)
    chat_textview.textColor = UIColor.whiteColor
    chat_textview.editable = false
    chat_textview.text = "chat goes here"
    chat_textview.backgroundColor = UIColor.clearColor
    chat_textview.frame = [[0,25], [320, 330]]
    @chat_textview = chat_textview
    chat_textview
  end

  def socketIO(socket, didReceiveEvent:packet)
    if packet.name == 'message'
      @chat_textview.text =  packet.args.first + "\n" + @chat_textview.text 
    end
  end

  def start_socketio
    @socketIO = SocketIO.alloc.initWithDelegate(self)
    @socketIO.connectToHost("jamesjn.com", onPort:8080);
    @socketIO.sendEvent("join", withData:{name: "iphone"})
  end

  def socketIO(socket, didReceiveMessage:packet)
    p packet.data
  end

end
