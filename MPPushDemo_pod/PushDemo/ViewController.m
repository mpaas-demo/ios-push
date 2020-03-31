

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"push";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    label.text = @"客户端的配置代码在AppDelegate中。请先在mpaas控制台中配置正确的推送证书，然后推送消息。";
}


@end
