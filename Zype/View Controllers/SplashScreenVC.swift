//
//  SplashScreenVC.swift
//  Svetliy
//
//  Created by Andrey Kasatkin on 1/20/17.
//  Copyright © 2017 Eugene Lizhnyk. All rights reserved.
//

import UIKit
import ZypeAppleTVBase

class SplashScreenVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    var beenPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
         loadAppInfo()
    }
    
    
    func loadAppInfo() {
        ZypeAppleTVBase.sharedInstance.getAppInfo(QueryBaseModel(), completion: {(backgroundUrl, featuredPlaylistId, error) in
            if (featuredPlaylistId != nil) {
                UserDefaults.standard.set(featuredPlaylistId, forKey: Const.kDefaultsRootPlaylistId)
                UserDefaults.standard.synchronize()
            }
            
            if (backgroundUrl != nil) {
                UserDefaults.standard.set(backgroundUrl, forKey: Const.kDefaultsBackgroundUrl)
                UserDefaults.standard.synchronize()
            }
          
            DispatchQueue.main.sync {
                self.performSegue(withIdentifier: Const.kShowTabBarSegueId, sender: nil)
            }
            
            
        })
    }
    
}
