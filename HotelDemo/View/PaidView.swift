//
//  PaidView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct PaidView: View {

    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = PaidViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 2) {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    VStack {
                        ButtonGoTo(viewModel: viewModel.buttonGoToVM) {
                            coordinator.goHome()
                        }
                        .padding()
                        .background(Color.white)
                    }
                }
                .background(Color("BackgraundGreyColor"))
                VStack(spacing: 32) {
                    ZStack {
                        Circle()
                            .frame(width: 94)
                            .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.98))
                        Image("PartyPopper")
                            .frame(width: 44, height: 44)
                    }
                    VStack(spacing: 20) {
                        Text("Ваш заказ принят в работу")
                            .font(Font.custom("SF Pro Display", size: 22)
                                .weight(.medium))
                            .multilineTextAlignment(.center)
                        Text(viewModel.orderConfirmation)
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .frame(width: 329, alignment: .top)
                    }
                    .padding(.horizontal, 23)
                }
                .padding(.vertical, 8)
            }
        }
        .modifier(BackgroundElement(name: viewModel.name, completion: {
            coordinator.goBack()
        }))
    }
    
}

struct PaidView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            PaidView()
                .environmentObject(Coordinator())
        }
    }
    
}
