//
//  QRcs.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//

import SwiftUI
import CodeScanner
import FirebaseFirestore
import FirebaseCore


struct QRcs: View {
    
    
    
    @State var id : String
    @ObservedObject var BP : Progress
    @ObservedObject var limit : LimitScan
    @State var dism = false
    @State var al = false
    
    
    var body: some View {
        
        VStack{
            if (self.BP.BP < 6) && (self.limit.limit < 6) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "ILoveCheechAndChong!" {
                                                        
                                                       
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.BP.BP += 1
                                                        self.limit.limit += 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["BonusProgress": self.BP.BP]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                        db.collection("Account").document(self.id).updateData(["limit": self.limit.limit]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        }
            else if (self.limit.limit < 6) {
            ZStack{
                Color.white
                VStack(alignment: .center){
                Text("Заберите Купон!")
                Text("Прежде чем сканировать код, получите купон под индикатором прогресса")
                }
                
                
            }
            
            
        }
            else{
                ZStack{
                    Color.white
                    VStack(alignment: .center){
                    Text("Вы достигли лимита на сканирования")
                    Text("Загляните позже !")
                    }
                    
                    
                }
            }
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Вы получили БонусПрогресс"), dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct QR1: View {
    
    
    
    @State var id : String
    @State var dism = false
    @State var al = false
    @State var First : Int = 0
    @ObservedObject var UserData : User
    @State var Used : Int = 0
    var body: some View {
        
        VStack{
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "CheechActivate!" {
                                                        
                                                        
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.First = UserData.UserData.FirstCupon - 1
                                                        self.Used = UserData.UserData.Used + 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["FirstCupon": self.First]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        db.collection("Account").document(self.id).updateData(["Used": self.Used]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        
        
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Купон Активирован"), dismissButton: .default(Text("Ok")))
        }
        
    }
}


struct QR2: View {
    
    
    
    @State var id : String
    @State var dism = false
    @State var al = false
    @State var Second : Int = 0
    @State var Used : Int = 0
    @ObservedObject var UserData : User
    
    var body: some View {
        
        VStack{
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "CheechActivate!" {
                                                        
                                                        
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.Second = UserData.UserData.SecondCupon - 1
                                                        self.Used = UserData.UserData.Used + 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["SecondCupon": self.Second]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        db.collection("Account").document(self.id).updateData(["Used": self.Used]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        
        
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Купон Активирован"), dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct QR3: View {
    
    
    
    @State var id : String
    @State var dism = false
    @State var al = false
    @State var Third : Int = 0
    @State var Used : Int = 0
    @ObservedObject var UserData : User
    
    var body: some View {
        
        VStack{
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "CheechActivate!" {
                                                        
                                                        
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.Third = UserData.UserData.ThirdCupon - 1
                                                        self.Used = UserData.UserData.Used + 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["ThirdCupon": self.Third]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        db.collection("Account").document(self.id).updateData(["Used": self.Used]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        
        
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Купон Активирован"), dismissButton: .default(Text("Ok")))
        }
        
    }
}


struct QR4: View {
    
    
    
    @State var id : String
    @State var dism = false
    @State var al = false
    @State var Fourth : Int = 0
    @State var Used : Int = 0
    @ObservedObject var UserData : User
    
    var body: some View {
        
        VStack{
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "CheechActivate!" {
                                                        
                                                        
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.Fourth = UserData.UserData.FourthCupon - 1
                                                        self.Used = UserData.UserData.Used + 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["FourthCupon": self.Fourth]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        db.collection("Account").document(self.id).updateData(["Used": self.Used]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        
        
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Купон Активирован"), dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct QR5: View {
    
    
    
    @State var id : String
    @State var dism = false
    @State var al = false
    @State var Fifth : Int = 0
    @State var Used : Int = 0
    @ObservedObject var UserData : User
    
    var body: some View {
        
        VStack{
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "CheechActivate!" {
                                                        
                                                        
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.Fifth = UserData.UserData.FifthCupon - 1
                                                        self.Used = UserData.UserData.Used + 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["FifthCupon": self.Fifth]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        db.collection("Account").document(self.id).updateData(["Used": self.Used]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        
        
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Купон Активирован"), dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct QR6: View {
    
    
    
    @State var id : String
    @State var dism = false
    @State var al = false
    @State var Sixth : Int = 0
    @State var Used : Int = 0
    @ObservedObject var UserData : User
    
    var body: some View {
        
        VStack{
            CodeScannerView(codeTypes: [.qr], simulatedData: "111") { result in
                                                
                                                switch result {
                                                case .success(let code):
                                                    
                                                    if code == "CheechActivate!" {
                                                        
                                                        
                                                        let db = Firestore.firestore()
                                                        self.al.toggle()
                                                        self.Sixth = UserData.UserData.SixthCupon - 1
                                                        self.Used = UserData.UserData.Used + 1
                                                        
                                                        
                                                        db.collection("Account").document(self.id).updateData(["SixthCupon": self.Sixth]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        db.collection("Account").document(self.id).updateData(["Used": self.Used]) { (err) in
                                                            
                                                            if err != nil{
                                                                
                                                                print((err?.localizedDescription)!)
                                                                return
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                case .failure(let error):
                                                    print(error.localizedDescription)
                                                }
                                                
                                                
            }
            
            
        
        
        }.alert(isPresented: self.$al) {
            
            Alert(title: Text("Успешно!"), message: Text("Купон Активирован"), dismissButton: .default(Text("Ok")))
        }
        
    }
}
