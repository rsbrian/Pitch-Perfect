//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by rsbrian on 2015/9/26.
//  Copyright © 2015年 rsbrian. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    var filePathUrl: NSURL!
    var title: String!
    
    init(url: NSURL!, title: String!) {
        self.filePathUrl = url
        self.title = title
    }
    
}
