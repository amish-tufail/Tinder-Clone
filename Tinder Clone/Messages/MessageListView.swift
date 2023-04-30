//
//  MessageListView.swift
//  Tinder Clone
//
//  Created by Amish Tufail on 30/04/2023.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListDM = MessageListDM()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    var body: some View {
        VStack {
            textField
            messageList
            Spacer()
        }
        .modifier(HideNavigationView())
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        //        NavigationView {
        MessageListView()
        //        }
    }
}

extension MessageListView {
    var textField: some View {
        HStack {
            TextField("Search Matches", text: $searchText)
                .padding(7.0)
                .padding(.horizontal, 25.0)
                .background(Color.textFieldBG)
                .cornerRadius(8.0)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20.0, weight: .bold))
                        Spacer()
                    }
                    .padding(.leading, 4.0)
                }
                .padding(.horizontal, 10.0)
                .onTapGesture {
                    withAnimation(.linear(duration: 0.25)) {
                        self.isEditing = true
                    }
                }
                .animation(.linear(duration: 0.25), value: isEditing)
            if isEditing {
                Button {
                    withAnimation(.linear(duration: 0.25)) {
                        isEditing = false
                        searchText = ""
                        self.endEditing(true)
                    }
                } label: {
                    Text("Cancel")
                }
                .padding(.trailing, 10.0)
                .transition(.move(edge: .trailing))
            }
        }
    }
    
    var messageList: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.messagePreviews.filter({ searchText.isEmpty ? true : displayPreview($0) }), id: \.self) { preview in
                    NavigationLink {
                        ChatView(person: preview.person)
                    } label: {
                        MessageRowView(preview: preview)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    func displayPreview(_ preview: MessagePreview) -> Bool {
        if preview.person.name.contains(searchText) {
            return true
        }
        
        if preview.lastMessage.contains(searchText) {
            return true
        }
        return false
    }
}
