//
//  ProjectView.swift
//  codesList
//
//  Created by Briant Garza on 11/11/21.
//

import SwiftUI


struct ProjectView: View {
    
    let imageString: String
    var image: Image {
        Image(imageString)
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Python Web Scraper")
            image
            Text("Employer3423")
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(imageString: "python_logo")
    }
}
