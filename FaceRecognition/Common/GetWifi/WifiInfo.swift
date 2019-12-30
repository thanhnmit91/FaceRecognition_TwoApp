//
//  WifiInfo.swift
//  FaceRecognition
//
//  Created by administrator on 11/26/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

struct WifiInfo {
    public let interface:String
    public let ssid:String
    public let bssid:String
    init(_ interface:String, _ ssid:String,_ bssid:String) {
        self.interface = interface
        self.ssid = ssid
        self.bssid = bssid
    }
}

func getWifiInfo() -> Array<WifiInfo> {
    guard let interfaceNames = CNCopySupportedInterfaces() as? [String] else {
        return []
    }
    let wifiInfo:[WifiInfo] = interfaceNames.compactMap{ name in
        guard let info = CNCopyCurrentNetworkInfo(name as CFString) as? [String:AnyObject] else {
            return nil
        }
        guard let ssid = info[kCNNetworkInfoKeySSID as String] as? String else {
            return nil
        }
        guard let bssid = info[kCNNetworkInfoKeyBSSID as String] as? String else {
            return nil
        }
        return WifiInfo(name, ssid,bssid)
    }
    return wifiInfo
}
