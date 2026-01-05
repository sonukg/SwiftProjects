
//
//  Created by sonukg on 02/01/26.
//

import SwiftUI

struct EmptyListView: View {
  var body: some View {
    ContentUnavailableView {
      Circle()
        .fill(.blue.gradient)
        .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
        .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
        .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
        .frame(width: 180)
        .glassEffect() // TODO: - NEW CODE
        .overlay {
          Image(systemName: "movieclapper")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .foregroundStyle(Color(UIColor.secondarySystemBackground))
            .padding(.top, -6)
        }
        .padding(Edge.Set.bottom, 90)
    } description: {
      GroupBox {
        TabView {
          PageTabView(icon: "1.circle", description: "Add some movies to the watchlist if you plan to watch them later")
            .padding(Edge.Set.bottom, 36)
          
          PageTabView(icon: "2.circle", description: "Later on you can also choose a random film to watch")
            .padding(Edge.Set.bottom, 36)
        }
        .tabViewStyle(.page)
        .frame(minWidth: 0, maxWidth: 560, minHeight: 120, maxHeight: 180)
      }
    }
  }
}

#Preview("Light Theme") {
  EmptyListView()
}

#Preview("Dark Theme") {
  EmptyListView()
    .preferredColorScheme(.dark)
}

