//
//  ViewController.m
//  Objective-C-常用控件
//
//  Created by WeiChaoW on 16/9/21.
//  Copyright © 2016年 WeiChaoW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate,UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self createSwitch];
    //    [self createActivityIndicatorView];
    [self createSlider];
    //    [self createSegmentedControl];
    //    [self createStepper];
    //    [self createProcessView];
    //    [self createAlertView];
    //    [self createActionSheet];
}

//UISwitch开关控件
- (void)createSwitch{
    
    //创建UISwitch
    UISwitch *mySwitch = [[UISwitch alloc] init];
    
    //设置尺寸，控件的大小是固定的
    mySwitch.frame = CGRectMake(100, 100, 100, 30);
    
    //设置开关的状态
    mySwitch.on = YES;
    
    //设置开状态下的颜色
    mySwitch.onTintColor=[UIColor greenColor];
    
    //设置圆点的颜色
    mySwitch.thumbTintColor=[UIColor whiteColor];
    
    //设置边框的渲染色
    mySwitch.tintColor = [UIColor blueColor];
    
    //设置打开是的图片
    mySwitch.onImage = [UIImage imageNamed:@"icon2"];
    
    //设置关闭时的图片
    mySwitch.offImage = [UIImage imageNamed:@"icon1"];
    
    [mySwitch addTarget:self action:@selector(swithClick:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:mySwitch];
}
//switch的点击事件
- (void)swithClick:(UISwitch *)sender{
    
    if (sender.selected == YES) {
        
        NSLog(@"YES");
    }else{
        
        NSLog(@"NO");
    }
}

//UIActivityIndicatorView 活动指示器
- (void)createActivityIndicatorView{
    
    //创建活动指示器
    UIActivityIndicatorView *aiv=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    aiv.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;//灰色
    //    UIActivityIndicatorView *aiv2=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];//白色
    //    UIActivityIndicatorView *aiv3=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];//大的白色
    
    //添加活动指示器
    [self.view addSubview:aiv];
    
    //设置颜色
    aiv.color=[UIColor purpleColor];
    
    //活动指示器的中心坐标
    aiv.center = self.view.center;
    
    //活动指示器开始旋转
    [aiv startAnimating];
    
    //如何活动指示器没有旋转
    if ([aiv isAnimating] == NO) {
        
    }
    
    //活动指示器旋转10秒后停止
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(stop:) userInfo:aiv repeats:NO];
    
}

//10秒后触发的方法
-(void)stop:(NSTimer *)timer
{
    UIActivityIndicatorView *aiv = timer.userInfo;
    
    //活动指示器停止旋转
    [aiv stopAnimating];
    
    //当活动指示器停止旋转后就隐藏活动指示器
    aiv.hidesWhenStopped = YES;
}

//UISlider滑块控件
- (void)createSlider{
    
    //创建滑块控件，控件的高度固定是30
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    
    //添加滑块控件
    [self.view addSubview:slider];
    
    //设置最大值
    slider.maximumValue = 100;
    
    //设置最小值
    slider.minimumValue = 1;
    
    //设置当前值
    slider.value = 10;
    
    //设置最大值时的图片
    //    slider.maximumValueImage = [UIImage imageNamed:@"icon1"];
    
    //设置最小值时的图片
    //    slider.minimumValueImage = [UIImage imageNamed:@"icon2"];
    
    //设置是否继续
    slider.continuous = YES;
    
    //小拇指左边的线的颜色
    slider.minimumTrackTintColor = [UIColor redColor];
    
    //小拇指右边的线的颜色
    slider.maximumTrackTintColor = [UIColor greenColor];
    
    //设置小拇指的颜色
    slider.thumbTintColor = [UIColor blackColor];
    
    //设置滑块的位置
    [slider setValue:50 animated:YES];
    
    //滑块的set方法
    //- (void)setValue:(float)value animated:(BOOL)animated;
    //- (void)setThumbImage:(nullable UIImage *)image forState:(UIControlState)state;
    //- (void)setMinimumTrackImage:(nullable UIImage *)image forState:(UIControlState)state;
    // - (void)setMaximumTrackImage:(nullable UIImage *)image forState:(UIControlState)state;
    // - (nullable UIImage *)thumbImageForState:(UIControlState)state;
    // - (nullable UIImage *)minimumTrackImageForState:(UIControlState)state;
    // - (nullable UIImage *)maximumTrackImageForState:(UIControlState)state;
    
    //滑块的只读属性（三个当前图片）
    //currentThumbImage;
    //currentMinimumTrackImage;
    //currentMaximumTrackImage;
    
    //监测滑块的滑动
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
}

//事件处理
-(void)slider:(UISlider *)slider
{
    NSLog(@"value=%f",slider.value);
}


//UISegmentedControl分段选择
- (void)createSegmentedControl{
    
    //创建分段
    UISegmentedControl *segmentedControl= [[UISegmentedControl alloc]initWithItems:@[@"北京",@"天津",@"上海",@"重庆"]];
    
    //设置尺寸
    segmentedControl.frame=CGRectMake(10, 64, 300, 30);
    
    //点击后，一个短暂的属性
    //    segmentedControl.momentary = YES;
    
    //添加分段
    [self.view addSubview:segmentedControl];
    
    //默认选中天津
    segmentedControl.selectedSegmentIndex = 1;
    
    //设置色调
    segmentedControl.tintColor = [UIColor redColor];
    
    /*
     
     //设置某一段的名字
     - (void)setTitle:(nullable NSString *)title forSegmentAtIndex:(NSUInteger)segment;
     //某一段的名字
     - (nullable NSString *)titleForSegmentAtIndex:(NSUInteger)segment;
     
     //设置某一段的图片
     - (void)setImage:(nullable UIImage *)image forSegmentAtIndex:(NSUInteger)segment;
     //某一段的图片
     - (nullable UIImage *)imageForSegmentAtIndex:(NSUInteger)segment;
     
     //设置某一段的宽度
     - (void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment;
     //某一段的宽度
     - (CGFloat)widthForSegmentAtIndex:(NSUInteger)segment;
     
     //设置某一段的偏移量
     - (void)setContentOffset:(CGSize)offset forSegmentAtIndex:(NSUInteger)segment;
     //某一段的偏移量
     - (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment;
     
     //设置某一段的交互能力
     - (void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment;
     //某一段的交互能力
     - (BOOL)isEnabledForSegmentAtIndex:(NSUInteger)segment;
     
     //设置片段的图片
     - (void)setBackgroundImage:(nullable UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
     - (nullable UIImage *)backgroundImageForState:(UIControlState)state barMetrics:
     
     //设置标题为可变字符串
     - (void)setTitleTextAttributes:(nullable NSDictionary *)attributes forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
     - (nullable NSDictionary *)titleTextAttributesForState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
     
     */
    
    
    //添加点击事件
    [segmentedControl addTarget:self action:@selector(segmentedControl:) forControlEvents:UIControlEventValueChanged];
}

//点击事件的处理
-(void)segmentedControl:(UISegmentedControl *)segmentedControl
{
    //插入一个段
    [segmentedControl insertSegmentWithTitle:@"中国" atIndex:2 animated:YES];
    
    //插入一个段
    [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"icon1"] atIndex:2 animated:YES];
    
    //删除一个段
    [segmentedControl removeSegmentAtIndex:1 animated:YES];
    
    //删除所有的段
    //    [segmentedControl removeAllSegments];
    
    
    
    NSLog(@"点击的第%zd个，一共有%zd个",segmentedControl.selectedSegmentIndex,segmentedControl.numberOfSegments);
    
    
}

//UIStepper计数器/步进器
- (void)createStepper{
    
    //创建计数器
    UIStepper *stepper=[[UIStepper alloc]init];
    
    //设置计数器的中心
    stepper.center=CGPointMake(250, 100);
    
    //设置自动重复
    stepper.autorepeat = YES;
    
    //设置最小值
    stepper.minimumValue=1;
    
    //设置最大值
    stepper.maximumValue=100;
    
    //设置当前值
    stepper.value=20;
    
    //设置计数器的步幅
    stepper.stepValue = 10;
    
    //设置计数器的颜色
    stepper.tintColor = [UIColor redColor];
    
    //设置背景图片
    [stepper setBackgroundImage:[UIImage imageNamed:@"icon1"] forState:UIControlStateNormal];
    
    //设置➕那边的图片
    [stepper setIncrementImage:[UIImage imageNamed:@"icon2"] forState:UIControlStateNormal];
    
    //设置➖那边的图片
    [stepper setDecrementImage:[UIImage imageNamed:@"icon1"] forState:UIControlStateNormal];
    
    //添加点击事件
    [stepper addTarget:self action:@selector(stepper:) forControlEvents:UIControlEventValueChanged];
    
    //添加计数器
    [self.view addSubview:stepper];
    
    
}

//点击事件的处理
-(void)stepper:(UIStepper *)stepper{
    
    NSLog(@"%f",stepper.value);
}


//UIProcessView	进度条
- (void)createProcessView{
    
    //创建进度条
    UIProgressView *progressView=[[UIProgressView alloc]init];
    
    //设置进度条的尺寸
    progressView.frame=CGRectMake(20, 300, 280, 30);
    
    //设置进度条的风格
    progressView.progressViewStyle = UIProgressViewStyleBar;
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    
    //进度条当前的进度
    progressView.progress = 0.5;
    
    //进度条走过的颜色
    progressView.progressTintColor = [UIColor redColor];
    
    //进度条轨道的颜色
    progressView.trackTintColor = [UIColor blackColor];
    
    //进度条前进的的图片
    progressView.progressImage = [UIImage imageNamed:@"icon1"];
    
    //进度条轨道的图片
    progressView.trackImage = [UIImage imageNamed:@"icon2"];
    
    //设置当前进度
    [progressView setProgress:0.3 animated:YES];
    
    //添加进度条
    [self.view addSubview:progressView];
    
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Progress:) userInfo:progressView repeats:YES];
}

//定时器触发事件
-(void)Progress:(NSTimer *)timer
{
    UIProgressView *progressView = timer.userInfo;
    //增加进度条当前进度
    progressView.progress+=0.02;
    
}


//UIAlertView警告视图
- (void)createAlertView{
    
    //创建警告框
    UIAlertView *alertView = [[UIAlertView alloc] init];
    UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"标题" message:@"副标题" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    //警告框的标题
    alertView.title = @"输入用户名和密码";
    
    //设置警告框的风格
    alertView.alertViewStyle = UIAlertViewStyleDefault;//系统默认
    alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;//带密码输入框
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;//带普通文本输入框
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;//带用户名和密码输入框
    
    //设置警告框的按钮
    [alertView addButtonWithTitle:@"取消"];
    [alertView addButtonWithTitle:@"确定"];
    
    //设置警告框的代理
    alertView.delegate = self;
    
    //按钮的个数
    NSInteger nums = alertView.numberOfButtons;
    
    //取消按钮的下标
    NSInteger cancelIndex = alertView.cancelButtonIndex;
    
    //其它按钮中，第一个按钮的下标
    NSInteger otherIndex = alertView.firstOtherButtonIndex;
    
    //展示警告框
    [alertView show];
    
    //点击取消按钮时让警告框消失
    //- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
    
    
}

//代理方法
//  点击了那一个按钮
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    UITextField *nameText = [alertView textFieldAtIndex:0];
    UITextField *passwordText = [alertView textFieldAtIndex:1];
    
    NSLog(@"name:%@ pass:%@",nameText.text,passwordText.text);
}



//UIActionSheet 动作列表
- (void)createActionSheet{
    
    //创建列表
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"请选择联系方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打电话",@"发邮件",@"发短信", nil];
    
    //显示
    
    //设置代理
    //    actionSheet.delegate = self;
    
    //设置title
    //    actionSheet.title = @"请选择";
    
    //设置放风格
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;//默认风格，灰色背景，白色文字
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;//自动
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;//透明黑色背景，白色文字
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;//纯黑背景，白色文字
    
    //添加按钮
    [actionSheet addButtonWithTitle:@"京津追梦人"];
    
    //总的按钮数
    NSInteger nums = actionSheet.numberOfButtons;
    
    //取消按钮的下标
    NSInteger cancelIndex = actionSheet.cancelButtonIndex;
    
    //点击取消按钮让表消失
    //- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
    
    
    [actionSheet showInView:self.view];
    
}

//代理方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //可以知道点击了第几项。
    NSLog(@"点击了第%zd个按钮",buttonIndex);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
