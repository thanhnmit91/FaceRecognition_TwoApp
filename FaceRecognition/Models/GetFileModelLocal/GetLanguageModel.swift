//
//  GetLanguageModel.swift
//  FaceRecognition
//
//  Created by administrator on 11/26/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

enum GetLanguageModelEnum: String {
    case en = "en"
    case vi = "vi"
    case jp = "ja"
}

var getModelLanguage = GetLanguageModel.parseDic()

class GetLanguageModel: BaseModel {

    @objc dynamic var list_user: String?
    @objc dynamic var user: String?
    @objc dynamic var take_photo: String?
    @objc dynamic var photo_library: String?
    @objc dynamic var cancel: String?
    
    static var language: String = ""
    
    class func parseDic() -> GetLanguageModel?{
        let dic = GetLanguageModel.readPropertyList(nameFileDic: GetLanguageModel.checkExistFileLanguage())
        guard let _ = dic else {
            return nil
        }
        let model = GetLanguageModel(dictionary: dic as? NSDictionary ?? [:])
        return model
    }
    
    class func checkExistFileLanguage() -> String{
        if GetLanguageModel.language.isEmpty{
            switch "\(Locale.preferredLanguages[0].prefix(2))" {
            case GetLanguageModelEnum.en.rawValue, GetLanguageModelEnum.jp.rawValue:
                return "\(Locale.preferredLanguages[0].prefix(2))"
            default:
                return GetLanguageModelEnum.en.rawValue
            }
        }
        return GetLanguageModel.language
    }
}

extension BaseModel{
    
    class func readPropertyList(nameFileDic:String = "LanguageEL", typeFile: String = "plist") -> AnyObject? {
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        var plistData: AnyObject? //Our data
        let plistPath: String? = Bundle.main.path(forResource: nameFileDic, ofType: typeFile)! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {//convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as AnyObject
        } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
        return plistData ?? nil
    }
    
}
