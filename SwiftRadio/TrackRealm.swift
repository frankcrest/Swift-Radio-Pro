//
//  TrackRealm.swift
//  SwiftRadio
//
//  Created by Frank Chen on 2019-06-14.
//  Copyright © 2019 matthewfecher.com. All rights reserved.
//

import Foundation
import RealmSwift

class TrackRealm: Object {
  @objc dynamic var title = ""
  @objc dynamic var artist = ""
}
