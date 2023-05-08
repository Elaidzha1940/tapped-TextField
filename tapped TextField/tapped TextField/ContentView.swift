//  /*
//
//  Project: tapped TextField
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.05.2023
//
//  /*

import SwiftUI


enum SortEnum {
    case firstday, secondday, thirdday, lastday
}


struct SortView: View {
    @State var is_selected: SortEnum = .firstday
    
    @Binding var showConfirmationDialog: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                self.is_selected = .firstday
                didTap()
            } label: {
                getLabel(title: "1st Day", type: .firstday)
            }
            
            Button {
                self.is_selected = .secondday
                didTap()
            } label: {
                getLabel(title: "2nd Day", type: .secondday)
            }
            
            Button {
                self.is_selected = .thirdday
                didTap()
            } label: {
                getLabel(title: "3rd Day", type: .thirdday)
            }
            
            Button {
                self.is_selected = .lastday
                didTap()
            } label: {
                getLabel(title: "4th Day", type: .lastday)
            }
        }
        .foregroundColor(.black)
        .background(
            Color.orange
        )
        .cornerRadius(20)
        .padding()
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView(showConfirmationDialog: .constant(false))
    }
}

extension SortView {
    @ViewBuilder
    func getLabel(title: String, type: SortEnum) -> some View {
        HStack {
            Text(title)
            Spacer()
        }
        .padding()
        .background(is_selected == type ? Color.brown : .clear)
    }
    
    func didTap() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                showConfirmationDialog = false
            }
        }
    }
}
