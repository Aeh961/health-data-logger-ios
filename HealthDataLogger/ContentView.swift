import SwiftUI

struct ContentView: View {
    
    @State private var inputText = ""
    @State private var entries: [String] = []
    @State private var selectedType = "Health"
    @State private var insightText = ""
    
    var jsonExportText: String {
        let jsonArray = entries.map { entry in
            ["entry": entry]
        }
        
        if let jsonData = try? JSONSerialization.data(
            withJSONObject: jsonArray,
            options: .prettyPrinted
        ),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        
        return "[]"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Health Data Logger")
                .font(.title)
                .bold()
            
            HStack {
                Button("Health") {
                    selectedType = "Health"
                }
                
                Button("Activity") {
                    selectedType = "Activity"
                }
                
                Button("Sleep") {
                    selectedType = "Sleep"
                }
            }
            
            Text("Selected: \(selectedType)")
                .font(.subheadline)
            
            TextField(
                "Example: slept 8 hours, walked 30 min, headache level 2",
                text: $inputText
            )
            .textFieldStyle(.roundedBorder)
            
            Button("Add Entry") {
                if !inputText.isEmpty {
                    let newEntry = "[\(selectedType)] - \(inputText)"
                    entries.append(newEntry)
                    inputText = ""
                }
            }
            
            List(entries, id: \.self) { entry in
                Text(entry)
            }
            
            ShareLink(
                item: jsonExportText,
                subject: Text("Health Data JSON Export"),
                message: Text("Exported health data")
            ) {
                Text("Export JSON")
            }
            
            Button("Generate Insight") {
                if entries.isEmpty {
                    insightText = "No data to analyze yet."
                } else {
                    let sleepEntries = entries.filter { $0.contains("[Sleep]") }.count
                    let activityEntries = entries.filter { $0.contains("[Activity]") }.count
                    
                    let total = entries.count
                    let sleepRatio = Double(sleepEntries) / Double(total)
                    let activityRatio = Double(activityEntries) / Double(total)
                    
                    if sleepRatio > 0.5 {
                        insightText = "You are logging sleep frequently. Focus on improving sleep quality and consistency."
                    } else if activityRatio > 0.5 {
                        insightText = "Great activity consistency. Consider gradually increasing intensity or duration."
                    } else if sleepRatio < 0.3 {
                        insightText = "Your sleep logs are low. Try tracking sleep more consistently."
                    } else if activityRatio < 0.3 {
                        insightText = "Your activity logs are low. Consider increasing activity tracking."
                    } else {
                        insightText = "Your logging is balanced. Keep tracking consistently to identify trends."
                    }
                }
            }
            
            if !insightText.isEmpty {
                Text(insightText)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
