//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Ardak on 01.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState: CGSize = .zero
    @State var showCard = false

    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20: 0)
                .opacity(showCard ? 0.4: 1)
                .offset(y: showCard ? -200: 0)
                .animation(Animation.default.delay(0.1), value: showCard)

            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y:show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: show)

            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)

            CardView()
                .frame(width: showCard ? 375: 340.0, height: 220.0)
                .background(Color.black)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30: 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100: 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: showCard)
                .onTapGesture { self.showCard.toggle() }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                        }
                        .onEnded{ _ in
                            self.viewState = .zero
                            self.show = false
                        }
                )

            BottomCardView()
                .offset(x: 0, y: showCard ? 360: 1000)
                .blur(radius: show ? 20 : 0)
                //.animation(.default, value: showCard)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: showCard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 100, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof than Meng To has achived the UI Design course with approval from Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
