//
//  Const.swift
//  Zype
//
//  Created by Eugene Lizhnyk on 10/9/15.
//  Copyright © 2015 Eugene Lizhnyk. All rights reserved.
//
// GIT DESCRIPTION: 1.0-38-g71976d7

import UIKit
import ZypeAppleTVBase

class Const: NSObject {
    
    static let sdkSettings = SettingsModel(clientID: "b3589bcfffad139cd61be701ce30928c118c12730af3c462c5c1e884e8944e03",
                                           secret: "3da57d2c71655d9309811d2f4bfc0191d15d33659f7a84e02f87d15edc60a372",
                                           appKey: "IKuC8xERY-oYRxQfE6c1HSeRrxKcpCwcsPr614RfaxCkYsJLgwpBkpkEo88EsyWr",
                                           apiDomain:"https://api.zype.com",
                                           tokenDomain: "https://login.zype.com",
                                           userAgent: "zype tvos")
    
    
    static let kLimitLivestreamEnabled = false
    static let kAppStyleLight = true
    
    static let kBaseSectionInsets: UIEdgeInsets = UIEdgeInsets(top: 50, left: 90, bottom: 50, right: 90)
    static let kCollectionCellSize: CGSize = CGSize(width: 308, height: 220)
    static let kShowCellHeight: CGFloat = 310
    static let kCollectionHorizontalSpacing: CGFloat = 50.0
    static let kCollectionVerticalSpacing: CGFloat = 50.0
    static let kCollectionSectionHeaderHeight: CGFloat = 45.0
    static let kCollectionPagerCellSize: CGSize = CGSize(width: 1920, height: 700) //original iamge is 1450 x 630 or 1740 x 490
    
    static let kCollectionPagerVCBottomMargin: CGFloat = 70.0
    static let kCollectionSectionHeaderBottomMargin: CGFloat = 25.0
    static let kCollectionPagerHorizontalSpacing: CGFloat = 20.0
    static let kScrollableTextVCMaskInsets: UIEdgeInsets = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    static let kFavoritesKey = "Favorites"
    
    static let kDefaultsRootPlaylistId = "root_playlist_id"
    static let kDefaultsBackgroundUrl = "background_url"
    
    //Segues
    static let kShowTabBarSegueId = "ShowTabBar"
}
