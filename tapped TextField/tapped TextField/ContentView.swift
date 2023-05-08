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
                getLabel(title: "По возрастанию цены", type: .priceincrease)
            }
            
            Button {
                self.is_selected = .descendingprice
                didTap()
            } label: {
                getLabel(title: "По убыванию цены", type: .descendingprice)
            }
            
            Button {
                self.is_selected = .byrating
                didTap()
            } label: {
                getLabel(title: "По рейтингу", type: .byrating)
            }
            
            Button {
                self.is_selected = .bypromotions
                didTap()
            } label: {
                getLabel(title: "По акциям", type: .bypromotions)
            }
        }
        .foregroundColor(.brown)
        .background(
            Color.blue
        )
        .cornerRadius(20)
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
        .background(is_selected == type ? Color.red : .clear)
    }
    
    func didTap() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                showConfirmationDialog = false
            }
        }
    }
}
