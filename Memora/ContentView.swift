//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var showEditScreen = false
    
    var body: some View {
        HStack {
            Spacer()
            Text("Memora").font(.system(size: 22, weight: .bold)).padding()
            Spacer()
            
            Image(systemName: "plus.square.on.square").imageScale(.large).padding().onTapGesture {
                showEditScreen = true
            }
        }
        
        List {
            // insert this VStack in a loop of notes
            
            VStack(alignment: .leading, spacing:5) {
                HStack(spacing: 10) {
                    VStack {
                        Text("\(dayOfMonth(from: Date.now))").font(.title3).foregroundColor(.red)
                        Text("\(formatMonthFromDate(Date.now ))").font(.body)
                    }.padding().background(.white).cornerRadius(10).foregroundColor(.black)
                    Spacer()
                    
                    Text("A completely delightful and fun memory, one that, I never want to forget!").font(.body)
                    Spacer()
                }
                
                HStack {
                    Text("Tag").font(.system(size: 12)).foregroundColor(.black).padding(5).background(.yellow).cornerRadius(8)
                    
                    
                    Spacer()
                    Image(systemName: "square.and.pencil").imageScale(.large).onTapGesture {
                        showEditScreen = true
                    }
                }
            }
            .padding(10)
            .background(.teal.opacity(0.4))
            .cornerRadius(10)
            
        }.listStyle(PlainListStyle())
            .sheet(isPresented: $showEditScreen) {
                EditNoteView().onDisappear() {
                    // perform any desired actions if this is deleted
                }
            }
            .onAppear() {
                
            }
    }
    
    func dayOfMonth(from date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
    
    func formatMonthFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
    
}

#Preview {
    ContentView()
}
