//
//  ConfirmAnonymousUploadPanelController.swift
//  SayCheese
//
//  Created by Arasthel on 17/06/14.
//  Copyright (c) 2014 Jorge Martín Espinosa. All rights reserved.
//

import Foundation

class ConfirmAnonymousUploadPanelController: NSWindowController, NSWindowDelegate {
    
    @IBOutlet var dontShowAgainCheckBox : NSButton!
    
    var selectActionView: SelectActionViewController?
    
    override init()  {
        super.init()
    }
    
    override init(window: NSWindow!) {
        super.init(window: window)
        NSBundle.mainBundle().loadNibNamed("ConfirmAnonymousUploadPanel", owner: self, topLevelObjects: nil)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func uploadIt(sender: NSButton?) {
        if dontShowAgainCheckBox.state == NSOnState {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(true, forKey: "upload_anonymously")
            defaults.synchronize()
        }
        NSApp.stopModalWithCode(NSOKButton)
        close()
    }
    
    @IBAction func cancel(sender: NSButton?) {
        NSApp.stopModalWithCode(NSCancelButton)
        close()
    }
    
    
    
    
}