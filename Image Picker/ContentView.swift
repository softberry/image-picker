//
//  ContentView.swift
//  Image Picker
//
//  Created by Emre Sakarya on 06.08.22.
//

import SwiftUI



struct ContentView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View{
        HStack {
            Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(50)
                    .padding(.all, 4)
                    .frame(width: 100, height: 100)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(8)

            Text("Change photo")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .onTapGesture {
                        showSheet = true
                    }
        }
        .sheet(isPresented: $showSheet){
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
