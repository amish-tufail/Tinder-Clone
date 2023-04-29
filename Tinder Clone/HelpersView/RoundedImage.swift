//
//  RoundedImage.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 29/04/2023.
//

import SwiftUI

struct RoundedImage: View {
    var url: URL?
    var body: some View {
        AsyncImage(url: url)
            .scaledToFit()
            .frame(width: 175.0, height: 175.0)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
