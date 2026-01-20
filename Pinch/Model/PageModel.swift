//
//  PageModel.swift
//  Pinch
//
//  Created by sonukg on 06/01/26.
//

import Foundation

struct PageModel: Identifiable {
  let id: Int
  let imageName: String
}

extension PageModel {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
