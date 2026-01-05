//
//  Tip.swift
//  Grocery List
//
//  Created by sonukg on 09/12/25.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential Foods")
        var message: Text? = Text("Add essential foods to your list")
        var image: Image? = Image(systemName: "info.circle")
}
