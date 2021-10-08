//
//  OAlertView.swift
//  OAlertView
//
//  Created by SYQM on 2021/10/8.
//

import UIKit

/// view show postion
/// 视图弹出的位置
enum OAlertViewAlertType {
    case Center
    case Footer
}


class OAlertView: UIView {
    let backgroundView = UIView() //弹框的背景
    var contentView: UIView?  // 内容试图
    var clikBlankDismiss: Bool = false  // 点击背景空白区域是否消失
    /// 底视图，如果为空则为window 不为空则为传入的底视图
    var alertWindow: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configInit(){
        backgroundView.frame = self.frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.2
    }
}

/// API
private extension OAlertView{
    /// 弹出的视图, 如果不传则弹出再 UIWindow上
    func show(_ superView: UIView?){
        var loadView: UIView!
        if superView == nil {
            self.alertWindow = UIWindow(frame: UIScreen.main.bounds)
            self.alertWindow.windowLevel = .alert
            self.alertWindow.backgroundColor = UIColor.clear
            self.alertWindow.becomeKey()
        }else{
            loadView = superView!
        }
        
        
        
    }
    
    func dismiss(){
        
    }
}



/// Enter the name of the xib to pop up the view
/// and pop up frome the middle by default
/// 直接输入xib的名称即可弹出视图,默认从中间弹出
@discardableResult
func alertWithXib(_ xibName: String, type: OAlertViewAlertType = .Center) -> OAlertView{
    let view: UIView = Bundle.main.loadNibNamed(xibName, owner: nil, options: nil)?.last as! UIView
    return alertWithUIView(view)
}

/// Enter the instance View that you want to pop up
/// 传入要弹出试图的实例对象
@discardableResult
func alertWithUIView(_ view: UIView, type: OAlertViewAlertType = .Center) -> OAlertView{
    let alertView = OAlertView()
    return alertView
}



    
    
    
