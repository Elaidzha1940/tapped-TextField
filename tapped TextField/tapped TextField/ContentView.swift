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
    case priceincrease, descendingprice, byrating, bypromotions
}


struct SortView: View {
    @State var is_selected: SortEnum = .priceincrease
    
    @Binding var showConfirmationDialog: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                self.is_selected = .priceincrease
                didTap()
            } label: {
                getLabel(title: "1 st Day", type: .priceincrease)
            }
            
            Button {
                self.is_selected = .descendingprice
                didTap()
            } label: {
                getLabel(title: "2nd Day", type: .descendingprice)
            }
            
            Button {
                self.is_selected = .byrating
                didTap()
            } label: {
                getLabel(title: "3rd", type: .byrating)
            }
            
            Button {
                self.is_selected = .bypromotions
                didTap()
            } label: {
                getLabel(title: "По акциям", type: .bypromotions)
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
