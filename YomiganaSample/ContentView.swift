//
//  ContentView.swift
//  YomiganaSample
//
//  Created by Takenori Kabeya on 2024/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var yomigana: String = ContentView.emptyYomiganaMessage
    static let emptyYomiganaMessage = "漢字を入力するとここに読みがなが自動で入ります"
    
    var body: some View {
        Form {
            Section("漢字文字列") {
                TextField("文字列を入力", text: $text)
            }
            Section("読みがな") {
                Text(yomigana)
                    .foregroundStyle(text.isEmpty ? .tertiary : .secondary)
            }
        }
        .onChange(of: text) { (oldValue, newValue) in
            if text.isEmpty {
                yomigana = ContentView.emptyYomiganaMessage
            }
            else {
                yomigana = YomiganaUtils.getYomiganaOf(text)
            }
        }
    }
}

#Preview {
    ContentView()
}
