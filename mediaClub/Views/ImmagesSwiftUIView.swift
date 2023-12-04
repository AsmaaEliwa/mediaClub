import SwiftUI

struct ImmagesSwiftUIView: View {
    @State var images: [ImageModel] = []

    var body: some View {
        VStack {
            
                   if images.isEmpty {
                       Text("Loading images...")
                   } else {
                       ScrollView {
                           LazyVStack {
                               ForEach(images, id: \.id) { image in
                                   RemoteImage(urlString: image.urls.small)
                                                                  .aspectRatio(contentMode: .fit)
                                                                  .frame(width: 200, height: 200).padding()
                                   
                               }
                           }
                       }
                   }
               }
        .onAppear {
        
            APIDataManger.shared.getImages { success, data in
                
                if success {
                    images = data
                    
                }
            }
        }
    }
}

struct RemoteImage: View {
    let urlString: String
    @State private var image: Image? = nil
    
    var body: some View {
        if let image = image {
            image
        } else {
            ProgressView()
                .onAppear(perform: loadImage)
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }.resume()
    }
}
