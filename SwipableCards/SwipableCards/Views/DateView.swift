//
//  DateView.swift
//  SwipableCards
//
//  Created by Ronald Joubert on 12/3/20.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Thursday, 3 December")
                        .font(.title)
                        .bold()
                    Text("Today")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5 )
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
