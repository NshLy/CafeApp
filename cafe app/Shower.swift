//
//  Shower.swift
//  Cheech
//
//  Created by Артур on 04.10.2020.
//

import Combine
import MapKit

final class Shower: ObservableObject {
    @Published var show1: Int = 0
    @Published var show2: Int = 0
    @Published var show3: Int = 0
    @Published var show4: Int = 0
}

final class TabShow: ObservableObject {
    @Published var tab: Bool = false
    @Published var tab1: Int = 0
    @Published var tab2: Int = 0

}


final class CuponShow: ObservableObject {
    
    @Published var Cupon1 = false
    @Published var Cupon2 = false
    @Published var Cupon3 = false
    @Published var Cupon4 = false
    @Published var Cupon5 = false
    @Published var Cupon6 = false
    @Published var Cup1 = false
    @Published var Cup2 = false
    @Published var Cup3 = false
    @Published var Cup4 = false
    @Published var Cup5 = false
    @Published var Cup6 = false
}

class User: ObservableObject {
    
    @Published var  UserData: account = account(id: "", login: "", FirstCupon: 0, SecondCupon: 0, ThirdCupon: 0, FourthCupon: 0, FifthCupon: 0, SixthCupon: 0, BonusProgress: 0, AVA: "", Used: 0, limit: 0)
    
}

class Progress: ObservableObject {
   
    @Published var BP: Int = 0
    
}

class ShowScan: ObservableObject {
   
    @Published var Show: Bool = false
    
}

class LimitScan: ObservableObject {
   
    @Published var limit: Int = 0
    
}
