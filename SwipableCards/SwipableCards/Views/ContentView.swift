//
//  ContentView.swift
//  SwipableCards
//
//  Created by Ronald Joubert on 12/3/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [User] = [
            User(id: 0, firstName: "Kit", lastName: "Kat", age: 23, mutualFriends: 4, imageName: "kitty-0", occupation: "Napper"),
            User(id: 1, firstName: "Button", lastName: "Cutie", age: 27, mutualFriends: 0, imageName: "kitty-1", occupation: "Secret Agent"),
            User(id: 2, firstName: "Pumpkin", lastName: "Spice", age: 20, mutualFriends: 1, imageName: "kitty-2", occupation: "Food Taster"),
            User(id: 3, firstName: "Munchkin", lastName: "Dozer", age: 19, mutualFriends: 4, imageName: "kitty-3", occupation: "Groomer"),
            User(id: 4, firstName: "Taffy", lastName: "Laffy", age: 22, mutualFriends:18, imageName: "kitty-4", occupation: "Cat-nip Dealer"),
            User(id: 5, firstName: "Spunky", lastName: "Trouble", age: 24, mutualFriends: 3, imageName: "kitty-5", occupation: "Meower"),
            User(id: 6, firstName: "Dipsy", lastName: "Doo", age: 25, mutualFriends: 16, imageName: "kitty-6", occupation: "Cuddler"),
            User(id: 7, firstName: "Doodle", lastName: "Pie", age: 29, mutualFriends: 9, imageName: "kitty-7", occupation: "Purr Factory"),
            User(id: 8, firstName: "Pixie", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "kitty-8", occupation: "Pouncer"),
            User(id: 9, firstName: "Sir", lastName: "Meows-a-lot", age: 28, mutualFriends: 13, imageName: "kitty-9", occupation: "Mouser")
        ]
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return CGFloat(users.count - 1 - id) * 10
    }
    
    private var maxId: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    DateView()
                    ZStack {
                        ForEach(self.users, id: \.self) { user in
                            if (self.maxId - 3)...self.maxId ~= user.id {
                                CardView(user: user, onRemove: { removedUser in
                                    self.users.removeAll() { $0.id == removedUser.id}
                                })
                                .animation(.spring())
                                .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
