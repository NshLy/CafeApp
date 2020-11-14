//
//  Account.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//
import SwiftUI
import FirebaseFirestore
import FirebaseCore

struct Account: View {
    
    
    @ObservedObject var Cupon = CuponShow()
    @ObservedObject var UserData : User
    @State var ava = false
    @State var SelectedAva = ""
    @ObservedObject var Scan = ShowScan()
    @ObservedObject var AllData = getAccountData()
    @State var UserLogin = UserDefaults.standard.value(forKey: "login") as? String ?? ""
    
    @State private var isShowingScanner1 = false
    @State private var isShowingScanner2 = false
    @State private var isShowingScanner3 = false
    @State private var isShowingScanner4 = false
    @State private var isShowingScanner5 = false
    @State private var isShowingScanner6 = false
    
    var body: some View {
        
        VStack{
            
            if self.Cupon.Cupon1 || self.Cupon.Cupon2 || self.Cupon.Cupon3 || self.Cupon.Cupon4 || self.Cupon.Cupon5 || self.Cupon.Cupon6 {
                ZStack{
                    
                    Color(.white)
                    VStack(alignment: .center, spacing: 10){
                        Text("Сотрите верхний слой карточки!").font(.custom("gilroy", size: 22)).foregroundColor(.black)
                        if self.Cupon.Cupon1{
                        FirstCard(Scan: self.Scan)
                            if self.Scan.Show {
                                Button(action: {
                                    self.isShowingScanner1 = true
                                }){
                                    Text("Активировать Купон!").font(.custom("gilroy", size: 25))
                                }.sheet(isPresented: $isShowingScanner1, content:{
                                            QR1(id: self.UserData.UserData.id, UserData: UserData)})
                            }
                            
                        }
                        
                        else if self.Cupon.Cupon2{
                            SecondCard(Scan: self.Scan)
                            if self.Scan.Show {
                                Button(action: {
                                    self.isShowingScanner2 = true
                                }){
                                    Text("Активировать Купон!").font(.custom("gilroy", size: 25))
                                }.sheet(isPresented: $isShowingScanner2, content:{
                                            QR2(id: self.UserData.UserData.id, UserData: UserData)})
                            }
                        }
                        else if self.Cupon.Cupon3{
                            ThirdCard(Scan: self.Scan)
                            if self.Scan.Show {
                                Button(action: {
                                    self.isShowingScanner3 = true
                                }){
                                    Text("Активировать Купон!").font(.custom("gilroy", size: 25))
                                }.sheet(isPresented: $isShowingScanner3, content:{
                                            QR3(id: self.UserData.UserData.id, UserData: UserData)})
                            }
                        }
                        else if self.Cupon.Cupon4{
                            FourthCard(Scan: self.Scan)
                            if self.Scan.Show {
                                Button(action: {
                                    self.isShowingScanner4 = true
                                }){
                                    Text("Активировать Купон!").font(.custom("gilroy", size: 25))
                                }.sheet(isPresented: $isShowingScanner4, content:{
                                            QR4(id: self.UserData.UserData.id, UserData: UserData)})
                            }
                        }
                        else if self.Cupon.Cupon5{
                            FifthCard(Scan: self.Scan)
                            if self.Scan.Show {
                                Button(action: {
                                    self.isShowingScanner5 = true
                                }){
                                    Text("Активировать Купон!").font(.custom("gilroy", size: 25))
                                }.sheet(isPresented: $isShowingScanner5, content:{
                                            QR5(id: self.UserData.UserData.id, UserData: UserData)})
                            }
                        }
                        else if self.Cupon.Cupon6{
                            SixthCard(Scan: self.Scan)
                            if self.Scan.Show {
                                Button(action: {
                                    self.isShowingScanner6 = true
                                }){
                                    Text("Активировать Купон!").font(.custom("gilroy", size: 25))
                                }.sheet(isPresented: $isShowingScanner6, content:{
                                            QR6(id: self.UserData.UserData.id, UserData: UserData)})
                            }
                        }
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
                    }
                    
                }
            }
            
            else{
                
                ZStack{
                    Image("MainBack").resizable().frame(maxWidth: UIScreen.main.bounds.width , maxHeight: UIScreen.main.bounds.height).edgesIgnoringSafeArea(.all)
                    
                    
                   
                    ScrollView(.vertical, showsIndicators: false){
                        
                        ZStack{
                        if ava{
                        
                            ScrollView(.horizontal){
                                HStack{
                                
                                    Image("Ava1").resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle()).onTapGesture {
                                            self.ava = false
                                            self.SelectedAva = "Ava1"
                                            let db = Firestore.firestore()
                                            db.collection("Account").document(self.UserData.UserData.login).updateData(["AVA": self.SelectedAva]) { (err) in
                                                
                                                if err != nil{
                                                    
                                                    print((err?.localizedDescription)!)
                                                    return
                                                }
                                                
                                            }
                                        }
                                
                                    Image("Ava2").resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle()).onTapGesture {
                                            self.ava = false
                                            self.SelectedAva = "Ava2"
                                            let db = Firestore.firestore()
                                            db.collection("Account").document(self.UserData.UserData.login).updateData(["AVA": self.SelectedAva]) { (err) in
                                                
                                                if err != nil{
                                                    
                                                    print((err?.localizedDescription)!)
                                                    return
                                                }
                                                
                                            }
                                            
                                        }
                                    ZStack{
                                        
                                    Image("Ava3").resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle()).onTapGesture {
                                            if self.UserData.UserData.Used > 19 {
                                            self.ava = false
                                            self.SelectedAva = "Ava3"
                                            let db = Firestore.firestore()
                                            db.collection("Account").document(self.UserData.UserData.login).updateData(["AVA": self.SelectedAva]) { (err) in
                                                
                                                if err != nil{
                                                    
                                                    print((err?.localizedDescription)!)
                                                    return
                                                }
                                                
                                            }
                                            
                                        }
                                        }
                                        if self.UserData.UserData.Used < 20 {
                                            Image("20Tick").resizable().frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                        }
                                }
                               
                            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2 )
                            
                            }
                        
                        }
                        else{
                            VStack{
                                
                                Image(SelectedAva).resizable().frame(width: UIScreen.main.bounds.height * 0.25, height: UIScreen.main.bounds.height * 0.25 ).clipShape(Circle()).edgesIgnoringSafeArea(.all)
                                
                            }.padding(.bottom, 10).onAppear(){
                                if self.SelectedAva == ""{
                                self.SelectedAva = UserData.UserData.AVA
                                }
                            }
                        }
                    }
                        
                        VStack(spacing: 20){
                            
                            Text("Здравствуйте, \(UserData.UserData.id)").font(.custom("GILROY-MEDIUM", size: 20)).foregroundColor(.black)
                            Text("Вы уже активировали \(UserData.UserData.Used) купонов!").font(.custom("gilroy", size: 20)).foregroundColor(.black)
                            
                            
                            Button(action: {
                                
                                self.ava = true
                                
                            }) {
                                Text("Аватарки").font(.custom("gilroy", size: 20)).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                                
                            }.background(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .clipShape(Capsule())
                            .padding(.top, 0)
                            
                            Button(action: {
                                UserDefaults.standard.set(false, forKey: "status")
                                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                UserDefaults.standard.set("", forKey: "login")
                                NotificationCenter.default.post(name: NSNotification.Name("loginChange"), object: nil)
                                
                                
                            }){
                                
                                Text("Выход").font(.custom("gilroy", size: 20)).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                                
                            }.background(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .clipShape(Capsule())
                            .padding(.top, 0)
                            if (UserData.UserData.FirstCupon == 0)&&(UserData.UserData.SecondCupon == 0)&&(UserData.UserData.ThirdCupon == 0)&&(UserData.UserData.FourthCupon == 0)&&(UserData.UserData.FifthCupon == 0)&&(UserData.UserData.SixthCupon == 0){
                            Text("Здесь будут ваши купоны!").font(.custom("gilroy", size: 25)).foregroundColor(.black)
                            }
                            else{
                                
                                Text("Активируйте купон!").font(.custom("gilroy", size: 30)).foregroundColor(.black)
                            }
                        }
                        VStack{
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                HStack(spacing: -90){
                                    if (UserData.UserData.FirstCupon != 0) {
                                        ForEach(Range(1...self.UserData.UserData.FirstCupon)){i in
                                            
                                            Card1(Cupon: self.$Cupon.Cupon1)
                                        }
                                    }
                                    if (UserData.UserData.SecondCupon != 0) {
                                        ForEach(Range(1...self.UserData.UserData.SecondCupon)){i in
                                            
                                            Card2(Cupon: self.$Cupon.Cupon2)
                                        }
                                    }
                                    if (UserData.UserData.ThirdCupon != 0) {
                                        ForEach(Range(1...self.UserData.UserData.ThirdCupon)){i in
                                            
                                            Card3(Cupon: self.$Cupon.Cupon3)
                                        }
                                    }
                                    if (UserData.UserData.FourthCupon != 0) {
                                        ForEach(Range(1...self.UserData.UserData.FourthCupon)){i in
                                            
                                            Card4(Cupon: self.$Cupon.Cupon4)
                                        }
                                    }
                                    if (UserData.UserData.FifthCupon != 0) {
                                        ForEach(Range(1...self.UserData.UserData.FifthCupon)){i in
                                            
                                            Card5(Cupon: self.$Cupon.Cupon5)
                                        }
                                    }
                                    if (UserData.UserData.SixthCupon != 0) {
                                        ForEach(Range(1...self.UserData.UserData.SixthCupon)){i in
                                            
                                            Card6(Cupon: self.$Cupon.Cupon6)
                                        }
                                    }
                                    
                                }
                            }
                        }.padding(.bottom, 20)
                        
                        
                        
                       
                        
                        Text("Следите за нами в социальных сетях:").font(.custom("gilroy", size: 20)).foregroundColor(.black)
                        HStack{
                        VStack(spacing: 5){
                        Button(action: {

                            
                            if let url = URL(string: "https://www.instagram.com/cc.coffee") {
                                UIApplication.shared.open(url)
                            }

                        }, label: {
                            Image("instagram").renderingMode(.original)
                                .resizable().frame(width: 40, height: 40).cornerRadius(10)
                        })
                            Text("Instagram").font(.caption)
                                .fontWeight(.bold).lineLimit(1)
                    }
                            
                            VStack(spacing: 5){
                            Button(action: {

                                
                                if let url = URL(string: "https://t.me/CheechChong") {
                                    UIApplication.shared.open(url)
                                }

                            }, label: {
                                Image("telegram").renderingMode(.original)
                                    .resizable().frame(width: 40, height: 40).cornerRadius(10)
                            })
                                Text("Telegram").font(.caption)
                                    .fontWeight(.bold).lineLimit(1)
                        }
                    }
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.15)
                    }
                    
                }
                
            }
           
        }.onAppear(){
            
            for i in self.AllData.datas{

                if i.login == UserLogin {
                    
                    self.UserData.UserData.id = i.login
                    self.UserData.UserData.login = i.login
                    self.UserData.UserData.BonusProgress = i.BonusProgress
                    self.UserData.UserData.FirstCupon = i.FirstCupon
                    self.UserData.UserData.SecondCupon = i.SecondCupon
                    self.UserData.UserData.ThirdCupon = i.ThirdCupon
                    self.UserData.UserData.FourthCupon = i.FourthCupon
                    self.UserData.UserData.FifthCupon = i.FifthCupon
                    self.UserData.UserData.SixthCupon = i.SixthCupon
                    self.UserData.UserData.AVA = i.AVA
                    self.UserData.UserData.Used = i.Used
                    
                    
                   
                    

                }
            }
            
        }
        
    }
}

struct Card1: View {
    
    @Binding var Cupon : Bool
    
    
    
    var body: some View {
        ZStack{
            Image("1Main").resizable().cornerRadius(12).frame(width: 200, height: 350).shadow(color: .black, radius: 10, x: -2, y: 0)
            VStack{
                HStack{
                    
                    
                    Spacer().frame(width: 150)
                }
                Spacer().frame(height: 300)
            }
        }.onTapGesture {
            self.Cupon = true
        }
    }
}


struct Card2: View {
    
    @Binding var Cupon : Bool
    
    
    
    var body: some View {
        ZStack{
            Image("2Main").resizable().cornerRadius(12).frame(width: 200, height: 350).shadow(color: .black, radius: 10, x: -2, y: 0)
            VStack{
                HStack{
                    
                    
                    Spacer().frame(width: 150)
                }
                Spacer().frame(height: 300)
            }
        }.onTapGesture {
            self.Cupon = true
        }
    }
}



struct Card3: View {
    
    @Binding var Cupon : Bool
    
    
    
    var body: some View {
        ZStack{
            Image("3Main").resizable().cornerRadius(12).frame(width: 200, height: 350).shadow(color: .black, radius: 10, x: -2, y: 0)
            VStack{
                HStack{
                    
                    
                    Spacer().frame(width: 150)
                }
                Spacer().frame(height: 300)
            }
        }.onTapGesture {
            self.Cupon = true
        }
    }
}



struct Card4: View {
    
    @Binding var Cupon : Bool
    
    
    
    var body: some View {
        ZStack{
            Image("4Main").resizable().cornerRadius(12).frame(width: 200, height: 350).shadow(color: .black, radius: 10, x: -2, y: 0)
            VStack{
                HStack{
                    
                    
                    Spacer().frame(width: 150)
                }
                Spacer().frame(height: 300)
            }
        }.onTapGesture {
            self.Cupon = true
        }
    }
}


struct Card5: View {
    
    @Binding var Cupon : Bool
    
    
    
    var body: some View {
        ZStack{
            Image("5Main").resizable().cornerRadius(12).frame(width: 200, height: 350).shadow(color: .black, radius: 10, x: -2, y: 0)
            VStack{
                HStack{
                    
                    
                    Spacer().frame(width: 150)
                }
                Spacer().frame(height: 300)
            }
        }.onTapGesture {
            self.Cupon = true
        }
    }
}


struct Card6: View {
    
    @Binding var Cupon : Bool
    
    
    
    var body: some View {
        ZStack{
            Image("6Main").resizable().cornerRadius(12).frame(width: 200, height: 350).shadow(color: .black, radius: 10, x: -2, y: 0)
            VStack{
                HStack{
                    
                    
                    Spacer().frame(width: 150)
                }
                Spacer().frame(height: 300)
            }
        }.onTapGesture {
            self.Cupon = true
        }
    }
}
