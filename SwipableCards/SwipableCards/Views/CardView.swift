//
//  CardView.swift
//  SwipableCards
//
//  Created by Ronald Joubert on 12/3/20.
//

import SwiftUI

struct CardView: View {
    
    @State private var translation: CGSize = .zero
    
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5
    
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack (alignment: .leading) {
                Image(self.user.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(self.user.firstName) \(self.user.lastName) \(self.user.age)")
                            .font(.title)
                            .bold()
                        Text(self.user.occupation)
                            .font(.subheadline)
                            .bold()
                        Text("\(self.user.mutualFriends) Mutual Friends")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        self.translation = value.translation
                    }
                    .onEnded{ value in
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.user)
                        } else {
                            self.translation = .zero
                        }
                        
                    }
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(user: User(id: 0, firstName: "Kit", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "kitty-0", occupation: "Napper"), onRemove: {_ in
            
        })
            .frame(height: 400)
            .padding()
    }
}
