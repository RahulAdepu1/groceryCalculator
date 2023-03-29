//
//  ShoppingListItemAddView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/26/23.
//

import SwiftUI
import Combine

struct ShoppingListItemAddView: View {

    enum FocusedField {
        case int, dec
    }
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    @ObservedObject var input = NumbersOnly()
    
    @State var textFieldItemName: String = ""
    @State var textFieldItemCount: String = ""
//    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @FocusState var focusField: FocusedField?
    
    var body: some View {
        ScrollView{
            VStack() {
                CustomStringTextField(placeholderText: "Item Name", text: $textFieldItemName, keyboardType: .default)
                CustomNumberTextField(placeholderText: "Quantity", text: $input.value, keyboardType: .decimalPad)
//                    .focused($focusField, equals: .dec)
                Button(action: saveButtonPressed,
                       label: {
                    Text("Add Value")
                        .font(.headline)
                        .foregroundColor(Color.theme.textPrimaryColor)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.buttonAction)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 5, y: 5)
                })
                .opacity((textFieldItemName.count<2) ? 0.5 : 1.0)
                .disabled(textFieldItemName.count<2)
            }
            .font(.headline)
            .padding(15)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        focusField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
        }
        .navigationTitle("Add Items")
    }
    
    func saveButtonPressed(){
        print("Before Conversion ---->"+textFieldItemCount)
        let inputItemCount: Double = Double(textFieldItemCount) ?? 1.0
        print("After Conversion ---->\(inputItemCount)")
        coreDataVM.addListItems(inputItemName: textFieldItemName, inputItemCount: inputItemCount)
        dismiss()
        
    }
    
}

//MARK: - Preview

struct ShoppingListItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ShoppingListItemAddView()
        }
        .environmentObject(ShoppingListItemViewModel())
        .environmentObject(ShoppingListNameViewModel())
        .environmentObject(CoreDataViewModel())
    }
}


struct CustomStringTextField: View {
    
    @State private var offset: CGFloat = 1
    @State private var scaleEffect: CGFloat = 0
    @State private var color: Color = .gray.opacity(0.3)
    var placeholderText: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    
    var body: some View{
        ZStack(alignment: .leading) {
            Text(placeholderText)
                .padding(10)
                .foregroundColor(text.isEmpty ? color : color)
                .offset(x: 0, y: text.isEmpty ? offset : offset)
                .scaleEffect(text.isEmpty ? scaleEffect : scaleEffect, anchor: .leading)
            TextField(placeholderText+" min 2 char", text: $text)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3))
                )
                .keyboardType(keyboardType)
                .lineLimit(2)
        }
        .padding(.top, 15)
        .onChange(of: text) { newValue in
            withAnimation(.easeInOut) {
                if text.isEmpty{
                    color = .gray.opacity(0.3)
                    offset = 0
                    scaleEffect = 1
                }else{
                    color = Color.theme.textSecondaryColor
                    offset = -34
                    scaleEffect = 0.8
                }
            }
        }
//        .animation(.easeInOut(duration: 2), value: color)
//                .animation(.easeInOut(duration: 2), value: offset)
//                .animation(.easeInOut(duration: 2), value: scaleEffect)
    }
}


struct CustomNumberTextField: View {
    
    @State private var offset: CGFloat = 1
    @State private var scaleEffect: CGFloat = 0
    @State private var color: Color = .gray.opacity(0.3)
    var placeholderText: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    
    var body: some View{
        ZStack(alignment: .leading) {
            Text(placeholderText)
                .padding(10)
                .foregroundColor(text.isEmpty ? color : color)
                .offset(x: 0, y: text.isEmpty ? offset : offset)
                .scaleEffect(text.isEmpty ? scaleEffect : scaleEffect, anchor: .leading)
            TextField(placeholderText, text: $text)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3))
                )
                .keyboardType(keyboardType)
                .lineLimit(2)
        }
        .padding(.top, 15)
        .onChange(of: text) { newValue in
            withAnimation(.easeInOut) {
                if text.isEmpty{
                    color = .gray.opacity(0.3)
                    offset = 0
                    scaleEffect = 1
                }else{
                    color = Color.theme.textSecondaryColor
                    offset = -34
                    scaleEffect = 0.8
                }
            }
        }
//        .animation(.easeInOut(duration: 2), value: color)
//                .animation(.easeInOut(duration: 2), value: offset)
//                .animation(.easeInOut(duration: 2), value: scaleEffect)
    }
}

struct NumbersOnlyViewModifier: ViewModifier {
    
    @Binding var text: String
    var includeDecimal: Bool
    
    func body(content: Content) -> some View {
        content
            .keyboardType(includeDecimal ? .decimalPad : .numberPad)
            .onReceive(Just(text)) { newValue in
                var numbers = "0123456789"
                let decimalSeparator: String = Locale.current.decimalSeparator ?? "."
                if includeDecimal {
                    numbers += decimalSeparator
                }
                if newValue.components(separatedBy: decimalSeparator).count-1 > 1 {
                    let filtered = newValue
                    self.text = String(filtered.dropLast())
                } else {
                    let filtered = newValue.filter { numbers.contains($0)}
                    if filtered != newValue {
                        self.text = filtered
                    }
                }
            }
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = ""{
        didSet {
            let filtered = value.filter{ $0.isNumber }
            if value != filtered {
                value = filtered
            }
        }
    }
}

extension View {
    func numbersOnly(_ text: Binding<String>, includeDecimal: Bool = false) -> some View {
        self.modifier(NumbersOnlyViewModifier(text: text, includeDecimal: includeDecimal))
    }
}
