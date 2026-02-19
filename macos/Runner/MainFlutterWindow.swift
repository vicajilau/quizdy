import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController
    
    // Set initial size
    var initialFrame = self.frame
    initialFrame.size = NSSize(width: 1024, height: 800)
    self.setFrame(initialFrame, display: true)
    
    self.minSize = NSSize(width: 400, height: 300)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
