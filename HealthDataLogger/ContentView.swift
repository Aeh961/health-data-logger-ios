import SwiftUI

struct ContentView: View {
    
    @State private var inputText = ""
    @State private var entries: [String] = []
    @State private var selectedType = "Health"
    
    
    var body: some View {
        HStack{
            Button("Health") {
                selectedType = "Health"
            }
            Button ("Activity") {
                selectedType = "Activity"
            }
            
            Button("Sleep"){
                selectedType = "sleep"
            }
        
        }
        VStack {
            TextField("Enter Health, activity, or sleep data", text:  $inputText).textFieldStyle(.roundedBorder)
            
            Button("Add Entry") {
                if !inputText.isEmpty{
                    let newEntry = "[\(selectedType)] - (inputText)"
                    entries.append(newEntry)
                    inputText = ""
                }
            }
            List(entries, id:\.self) { entry in
                Text(entry)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
