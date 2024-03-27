//
//  SwiftUIView_Image.swift
//  003_UIImagaView
//
//  Created by 高广校 on 2024/3/27.
//

import SwiftUI

struct SwiftUIView_Image: View {
    var body: some View {
        
        VStack(content: {
            
            Text("Hello, World!")
            
            Image(.loginTopIcon)
            
            Image(._1LoginTopIcon)
            
            Image(.LOGIN)
        })
        
    }
}

#Preview {
    SwiftUIView_Image()
}
