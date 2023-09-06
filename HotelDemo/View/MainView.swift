//
//  MainView.swift
//  HotelDemo
//
//  Created by Лаборатория on 06.09.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(MyPage.hotel)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page)
                }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        MainView()
            .environmentObject(Coordinator())
    }

}
