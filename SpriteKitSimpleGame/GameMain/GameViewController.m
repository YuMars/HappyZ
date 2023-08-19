//
//  GameViewController.m
//  SpriteKitSimpleGame
//
//  Created by caohanchao on 2017/3/8.
//  Copyright © 2017年 chc. All rights reserved.
//

#import "GameViewController.h"
//#import "GameScene.h"
#import "MyScene.h"
#import "SKMainScene.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVCaptureInput.h>
#import <AVFoundation/AVCaptureSession.h>
#import <AVFoundation/AVCaptureVideoPreviewLayer.h>
#import <CoreMotion/CoreMotion.h>
#import "ResultVC.h"

@interface GameViewController ()
{
    AVCaptureSession *_captureSession;
    AVCaptureVideoPreviewLayer *_captureLayer;
    AVCaptureDeviceInput *_captureInput;
}

@property (nonatomic, strong) UIView *cameraV;
@property (nonatomic, strong)SKView *skView;
@property (nonatomic, strong)UILabel *lb_score;
@property (nonatomic, strong)UIButton *btn_strat;

@property (nonatomic, strong)SKMainScene *scene;

@property (nonatomic, strong)UIButton *leftBtn;

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *buttonChage;

@property (nonatomic, strong) UIButton *buttonHand;

@property (nonatomic, strong) UIButton *buttonGravity;
@property (nonatomic, strong) UILabel *lingmingduLbl;
@property (nonatomic, strong) UISlider *lmdSlider;

@property (nonatomic, strong) CMMotionManager *manager;

@end

@implementation GameViewController

- (UIView *)cameraV {
    if (!_cameraV) {
        _cameraV = [[UIView alloc] initWithFrame:self.view.bounds];
    }
    return _cameraV;
}

- (SKView *)skView {
    if (!_skView) {
        _skView = [[SKView alloc] initWithFrame:self.view.bounds];
        _skView.showsFPS = YES;
        _skView.showsNodeCount = YES;
    }
    return _skView;
}

- (UILabel *)lb_score {
    if (!_lb_score) {
        _lb_score = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 20)];
        _lb_score.text = @"分数：0";
        _lb_score.font = [UIFont systemFontOfSize:15];
        _lb_score.textAlignment = NSTextAlignmentCenter;
        _lb_score.textColor = [UIColor colorWithRed:0.91 green:0.22 blue:0.10 alpha:1.00];
    }return _lb_score;
}

- (UIButton *)btn_strat {
    if (!_btn_strat) {
        _btn_strat = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_strat.frame = CGRectMake(0, 100, self.view.frame.size.width, 40);
        [_btn_strat setBackgroundColor:[UIColor blackColor]];
        [_btn_strat setTitle:@"开始游戏" forState:0];
        [_btn_strat addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
        [_skView addSubview:_btn_strat];
    }
    return _btn_strat;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //    [self initAll];
    //    [self btn_strat];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     // Load the SKScene from 'GameScene.sks'
     GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
     
     // Set the scale mode to scale to fit the window
     scene.scaleMode = SKSceneScaleModeAspectFill;
     
     SKView *skView = (SKView *)self.view;
     
     // Present the scene
     [skView presentScene:scene];
     
     skView.showsFPS = YES;
     skView.showsNodeCount = YES;
     */
    
    
    
    [self initAll];
    [self airplanePlay];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
//    _skView.paused = YES;
//    _scene.paused = YES;
    
    
    [_skView.scene.children enumerateObjectsUsingBlock:^(SKNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeAllActions];
        [obj removeAllChildren];
    }];
    
    [_scene.children enumerateObjectsUsingBlock:^(SKNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeAllActions];
        [obj removeAllChildren];
    }];
    
    [_scene removeActionForKey:@"musicAction"];
    [_skView delete:<#(nullable id)#>];
    
    [_scene removeAllActions];
    [_scene removeAllChildren];
    [_skView presentScene:nil];
    
    _scene = nil;
    _skView = nil;
}

- (SKMainScene *)scene {
    if (!_scene) {
        _scene = [SKMainScene sceneWithSize:self.skView.bounds.size];
        _scene.scaleMode = SKSceneScaleModeAspectFill;
        _scene.backgroundColor = [UIColor clearColor];
    }
    return _scene;
}

- (void)initAll {
    [self.view addSubview:self.cameraV];
    [self.view addSubview:self.skView];
    self.skView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor clearColor];
    //Create and configure the scene
    [self.skView presentScene:self.scene];
    
    UIImage *image = [UIImage imageNamed:@"BurstAircraftPause"];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(10, 25, image.size.width,image.size.height);
    [self.leftBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(isPause:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameOver) name:@"gameOverNotification" object:nil];
    
    UIView *pauseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
    
    self.button1 = [[UIButton alloc]init];
    [self.button1 setFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 100,50,200,30)];
    [self.button1 setTitle:@"继续" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button1.layer setBorderWidth:2.0];
    [self.button1.layer setCornerRadius:15.0];
    [self.button1.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.button1 addTarget:self action:@selector(continueGame:) forControlEvents:UIControlEventTouchUpInside];
    self.button1.hidden = YES;
    self.button1.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    [pauseView addSubview:self.button1];
    
    self.button2 = [[UIButton alloc]init];
    [self.button2 setFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 100,100,200,30)];
    [self.button2 setTitle:@"重新开始" forState:UIControlStateNormal];
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button2.layer setBorderWidth:2.0];
    [self.button2.layer setCornerRadius:15.0];
    [self.button2.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.button2 addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    self.button2.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    self.button2.hidden = YES;
    [pauseView addSubview:self.button2];
    
    self.button3 = [[UIButton alloc]init];
    [self.button3 setFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 100,150,200,30)];
    [self.button3 setTitle:@"结束训练" forState:UIControlStateNormal];
    [self.button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button3.layer setBorderWidth:2.0];
    [self.button3.layer setCornerRadius:15.0];
    [self.button3.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.button3 addTarget:self action:@selector(endAction) forControlEvents:UIControlEventTouchUpInside];
    self.button3.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    self.button3.hidden = YES;
    [pauseView addSubview:self.button3];
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) - 100.0, 0, 100.0, 200)];
    
    self.buttonChage = [[UIButton alloc]init];
    [self.buttonChage setFrame:CGRectMake(0.0,CGRectGetHeight(rightView.frame) - 50.0,95,45)];
    [self.buttonChage setTitle:@"切换摄像头" forState:UIControlStateNormal];
    [self.buttonChage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonChage.layer setBorderWidth:2.0];
    [self.buttonChage.layer setCornerRadius:12.0];
    [self.buttonChage.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.buttonChage addTarget:self action:@selector(chageCamare:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonChage.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    [rightView addSubview:self.buttonChage];
    
    self.buttonGravity = [[UIButton alloc]init];
    [self.buttonGravity setFrame:CGRectMake(0.0,CGRectGetHeight(rightView.frame) - 100.0,95,45)];
    [self.buttonGravity setTitle:@"模式2" forState:UIControlStateNormal];
    [self.buttonGravity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonGravity.layer setBorderWidth:2.0];
    [self.buttonGravity.layer setCornerRadius:12.0];
    [self.buttonGravity.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.buttonGravity addTarget:self action:@selector(buttonGravityAction) forControlEvents:UIControlEventTouchUpInside];
    self.buttonGravity.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    [rightView addSubview:self.buttonGravity];
    
    self.buttonHand = [[UIButton alloc]init];
    [self.buttonHand setFrame:CGRectMake(0.0,CGRectGetHeight(rightView.frame) - 150.0,95,45)];
    [self.buttonHand setTitle:@"模式1" forState:UIControlStateNormal];
    [self.buttonHand setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonHand.layer setBorderWidth:2.0];
    [self.buttonHand.layer setCornerRadius:12.0];
    [self.buttonHand.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.buttonHand addTarget:self action:@selector(buttonHandAction) forControlEvents:UIControlEventTouchUpInside];
    self.buttonHand.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    [rightView addSubview:self.buttonHand];
    
    self.lmdSlider.frame = CGRectMake(0.0,CGRectGetHeight(rightView.frame) - 200.0,95,45);
    [rightView addSubview:self.lmdSlider];
    
    self.lingmingduLbl.frame = CGRectMake(0.0,CGRectGetHeight(rightView.frame) - 250.0,95,45);
    [rightView addSubview:self.lingmingduLbl];
    
    pauseView.center = self.view.center;
    rightView.center = CGPointMake(rightView.center.x, self.view.frame.size.height / 2.0);
    
    [self.view addSubview:pauseView];
    [self.view addSubview:rightView];
    
    _captureInput = [AVCaptureDeviceInput deviceInputWithDevice:[self cameraWithPosition:AVCaptureDevicePositionBack] error:nil];
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:_captureInput];
    [_captureSession startRunning];
    _captureLayer = [AVCaptureVideoPreviewLayer layerWithSession: _captureSession];
    _captureLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _captureLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.cameraV.layer insertSublayer:_captureLayer above:0];
    //    [self.view.layer insertSublayer:_captureLayer atIndex:0];
}

- (void)addRightView {
    
}

- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition) position {
    
    //返回和视频录制相关的所有默认设备
    
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    //遍历这些设备返回跟position相关的设备
    
    for (AVCaptureDevice *device in devices) {
        
        if ([device position] == position) {
            
            return device;
            
        }
        
    }
    
    return nil;
    
}

- (void)gameOver{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self airplaneStop];
        UIView *backgroundView =  [[UIView alloc]initWithFrame:self.view.bounds];
        
        UIButton *button = [[UIButton alloc]init];
        [button setBounds:CGRectMake(0,0,200,30)];
        [button setCenter:backgroundView.center];
        [button setTitle:@"重新开始" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.layer setBorderWidth:2.0];
        [button.layer setCornerRadius:15.0];
        [button.layer setBorderColor:[[UIColor grayColor] CGColor]];
        [button addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
        [backgroundView addSubview:button];
        [backgroundView setCenter:self.view.center];
        
        UIButton *button2 = [[UIButton alloc]init];
        [button2 setBounds:CGRectMake(0,50,200,30)];
        [button2 setCenter:backgroundView.center];
        [button2 setTitle:@"结束训练" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button2.layer setBorderWidth:2.0];
        [button2.layer setCornerRadius:15.0];
        [button2.layer setBorderColor:[[UIColor grayColor] CGColor]];
        [button2 addTarget:self action:@selector(endAction) forControlEvents:UIControlEventTouchUpInside];
        [backgroundView addSubview:button2];
        
        [self.view addSubview:backgroundView];
    });
    
    
}

- (void)isPause:(UIButton *)btn {
    self.leftBtn.enabled = NO;
    
    ((SKView *)self.skView).paused = YES;
    
    self.button1.hidden = NO;
    self.button2.hidden = NO;
    self.button3.hidden = NO;
    self.button1.superview.hidden = NO;
    
    self.scene.paused = YES;
}

- (void)endAction {
    ResultVC *vc = [[ResultVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)restart:(UIButton *)button{
    button.superview.hidden = YES;;
    //    ((SKView *)self.view).paused = NO;
    self.scene.paused =NO;
    self.leftBtn.enabled = YES;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"restartNotification" object:nil];
    
    if (self.scene.isGravity) {
        [self airplanePlay];
    } else {
        [self airplaneStop];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)chageCamare:(UIButton *)button {
    
    AVCaptureDevicePosition position = _captureInput.device.position;
    AVCaptureDevice *newVideoDevice = nil;
    if (position == AVCaptureDevicePositionBack) {
        newVideoDevice = [self cameraWithPosition:AVCaptureDevicePositionFront];
    } else {
        newVideoDevice = [self cameraWithPosition:AVCaptureDevicePositionBack];
    }
    
    NSError *error;
    AVCaptureDeviceInput *newVideoInput = [AVCaptureDeviceInput deviceInputWithDevice:newVideoDevice error:&error];
    if (error) { return; }
    [_captureSession beginConfiguration];
    [_captureSession removeInput:_captureInput];
    if ([_captureSession canAddInput:newVideoInput]) {
        [_captureSession addInput:newVideoInput];
        _captureInput = newVideoInput;
    } else {
        [_captureSession addInput:_captureInput];
    }
    [_captureSession commitConfiguration];
    
}

// 手势模式
- (void)buttonHandAction {
    self.scene.isGravity = NO;
    [self airplaneStop];
}

// 重力模式
- (void)buttonGravityAction {
    self.scene.isGravity = YES;
    [self airplanePlay];
}

- (void)continueGame:(UIButton *)button{
    button.superview.hidden = YES;
    //    ((SKView *)self.view).paused = NO;
    self.scene.paused =NO;
    self.leftBtn.enabled = YES;
}

//-(void)start:(UIButton *)btn
//{
////    [btn removeFromSuperview];
//    [btn setHidden:YES];
//    [self.skView addSubview:self.lb_score];
//    
//    MyScene * scene = [MyScene sceneWithSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
//    //scene.scaleMode = SKSceneScaleModeAspectFill;
////    scene.overDelegate = self;
//    _lb_score.text = @"分数：0";
//    // Present the scene.
//    [_skView presentScene:scene];
//}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)airplanePlay {
    self.manager.deviceMotionUpdateInterval = 1.0 / 30.0;

    [self.manager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        //    开启主队列异步线程，更新球的位置。
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scene.accelleration = motion.gravity;
            [self.scene updateLocation];
        });
    }];
}

- (void)airplaneStop {
    [self.manager stopDeviceMotionUpdates];
}

- (void)useGyroPull{
    
    //判断陀螺仪可不可用
    if (self.manager.gyroAvailable){
        //设置陀螺仪多久采样一次
        self.manager.gyroUpdateInterval = 0.1;
        //开始更新，后台线程开始运行。这是Pull方式。
        [self.manager startGyroUpdates];
    }
    //获取并处理陀螺仪数据。这里我们就只是简单的做了打印。
//    NSLog(@"X = %f,Y = %f,Z = %f",self.manager.gyroData.rotationRate.x,self.manager.gyroData.rotationRate.y,self.manager.gyroData.rotationRate.z);
}


- (void)sliderValueChange:(UISlider *)slider {
    NSInteger value = 2000 + slider.value * 6000;
    self.scene.sensitivity = value;
}


- (CMMotionManager *)manager{
    if (!_manager) {
        _manager = [[CMMotionManager alloc] init];
    }
    return _manager;
}

- (UILabel *)lingmingduLbl {
    if (!_lingmingduLbl) {
        _lingmingduLbl = [[UILabel alloc] init];
        _lingmingduLbl.font = [UIFont systemFontOfSize:17.0];
        _lingmingduLbl.text = @"灵敏度";
        _lingmingduLbl.textAlignment = NSTextAlignmentCenter;
        _lingmingduLbl.textColor = [UIColor blackColor];
        _lingmingduLbl.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
        _lingmingduLbl.layer.borderWidth = 2.0;
        _lingmingduLbl.layer.cornerRadius = 12.0;
        _lingmingduLbl.layer.masksToBounds = YES;
        _lingmingduLbl.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _lingmingduLbl;
}

- (UISlider *)lmdSlider {
    if (!_lmdSlider) {
        _lmdSlider = [[UISlider alloc] init];
        _lmdSlider.minimumTrackTintColor = [UIColor grayColor];
        _lmdSlider.maximumTrackTintColor = [UIColor whiteColor];
        _lmdSlider.value = 1000.0 / 6000.0;
//        [_lmdSlider addTarget:self action:@selector(sliderValueBegin:) forControlEvents:UIControlEventTouchUpInside];
        [_lmdSlider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
//        [_lmdSlider addTarget:self action:@selector(sliderValueChangeEnd:) forControlEvents:UIControlEventTouchUpOutside];
    }
    return _lmdSlider;
}

@end
