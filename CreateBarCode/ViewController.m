//
//  ViewController.m
//  CreateBarCode
//
//  Created by 梅龙飞 on 16/7/21.
//  Copyright © 2016年 梅龙飞. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeGenerator.h"

@interface ViewController ()

//输入的文字
@property (weak, nonatomic) IBOutlet UITextField *textfont;
//生成二维码的图片
@property (weak, nonatomic) IBOutlet UIImageView *barcodeimgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//步骤：
    //1.生成二维码的前提 导入库 libqrencode
    //2.导入头文件#import "QRCodeGenerator.h"
    //3.把一个文本字符串转化成 二维码图片

//生成二维码按钮
- (IBAction)createBarCode:(id)sender {
    /**
     *  第一个参数 要转化为二维码的字符串
        第二个参数 生成二维码尺寸的大小
     *
     *  @return <#return value description#>
     */
    //转化为二维码的图片
    UIImage *image = [QRCodeGenerator qrImageForString:self.textfont.text imageSize:300];
    self.barcodeimgV.image = image;
    
    /**
     *  生成二维码后我们可以选择将它保存为本地图片 就会用到下面这个方法
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        第一个参数 UIImage对象
        第二个参数 任意对象地址
        第三个参数 保存之后 会让第二个参数调用第三个参数对应的方法
     *
     *  @return <#return value description#>
     */
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//保存图片之后调用的结果
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"保存失败:%@",error);
    } else {
        NSLog(@"保存成功！");
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
