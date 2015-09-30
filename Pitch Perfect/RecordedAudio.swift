//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by rsbrian on 2015/9/26.
//  Copyright © 2015年 rsbrian. All rights reserved.
//

import Foundation

// Differences between subclassing NSObject and using a Swift base class:
// http://stackoverflow.com/questions/24057525/swift-native-base-class-or-nsobject
class RecordedAudio {
    var filePathUrl: NSURL!
    var title: String!
    
    init(url: NSURL!, title: String!) {
        self.filePathUrl = url
        self.title = title
    }
    
}
