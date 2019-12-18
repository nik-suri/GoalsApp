//
//  CircleImage.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/17/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .padding()
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.gray)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(systemName: "list.dash"))
    }
}
