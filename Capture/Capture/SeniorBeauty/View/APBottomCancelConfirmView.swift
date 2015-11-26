//
//  APBottomCancelConfirmView.swift
//  Capture
//
//  Created by ShawnDu on 15/11/26.
//  Copyright © 2015年 ShawnDu. All rights reserved.
//

import UIKit

protocol APBottomCancelConfirmViewDelegate {
    func cancelButtonPressed()
    func confirmButtonPressed()
}

class APBottomCancelConfirmView: UIView {

    var apBottomCancelConfirmViewDelegate: APBottomCancelConfirmViewDelegate?
    var titleLabel: UILabel!
    let kLabelWidth: CGFloat = 200
    var title: String? {
        set {
            self.updateLabelFrame()
        }
        get {
            return self.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    private func initViews() {
        self.backgroundColor = UIColor.clearColor()
        self.addCancelButton()
        self.addConfirmButton()
    }
    
    //MARK: - event response
    func cancelButtonPressed(sender: UIButton) {
        self.apBottomCancelConfirmViewDelegate?.cancelButtonPressed()
    }
    
    func confirmButtonPressed(sender: UIButton) {
        self.apBottomCancelConfirmViewDelegate?.confirmButtonPressed()
    }
    
    //MARK: - private method
    private func addCancelButton() {
        let cancelButton = UIButton.init(frame: CGRectMake(0, 0, kButtonClickWidth, kButtonClickWidth))
        cancelButton.setImage(UIImage(named: "cancelNormal"), forState: UIControlState.Normal)
        cancelButton.setImage(UIImage(named: "cancelPress"), forState: UIControlState.Highlighted)
        cancelButton.addTarget(self, action: "cancelButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(cancelButton)
    }
    
    private func addConfirmButton() {
        let confirmButton = UIButton.init(frame: CGRectMake(0, self.width - kButtonClickWidth, kButtonClickWidth, kButtonClickWidth))
        confirmButton.setImage(UIImage(named: "confirmNormal"), forState: UIControlState.Normal)
        confirmButton.setImage(UIImage(named: "confirmPress"), forState: UIControlState.Highlighted)
        confirmButton.addTarget(self, action: "confirmButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(confirmButton)
    }
    
    private func addTitleLabel() {
        self.titleLabel = UILabel.init()
        self.titleLabel.font = UIFont.systemFontOfSize(12)
        self.updateLabelFrame()
    }
    
    private func updateLabelFrame() {
        self.titleLabel.text = self.title
        let rect = self.titleLabel.textRectForBounds(CGRectMake((kScreenWidth - kLabelWidth)/2, 0, kLabelWidth, self.height), limitedToNumberOfLines: 1)
        self.titleLabel.frame = CGRectMake((kScreenWidth - rect.size.width)/2, (self.height - rect.size.height)/2, rect.size.width, rect.size.height)
    }
}