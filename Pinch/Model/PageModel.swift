//
//  PageModel.swift
//  Pinch
//
//  Created by sonukg on 06/01/26.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
