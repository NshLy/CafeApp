//
//  Main.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import SDWebImageSwiftUI
import FirebaseFirestore
import CodeScanner



struct Main: View {
  
    @State var selectedTab = "Меню"
    @ObservedObject var UserData = User()
    @ObservedObject var AllData = getAccountData()
    @State var UserLogin = UserDefaults.standard.value(forKey: "login") as? String ?? ""
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @ObservedObject var BP = Progress()
    @ObservedObject var limit = LimitScan()
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            
            ZStack{
                if self.selectedTab == "Меню"{
                    
                    Main1(limit: self.limit, UserData: self.UserData,  BP: self.BP)
                        
                }
                else if self.selectedTab == "Аккаунт"{
                    
                   
                    
                    Account(UserData: self.UserData)
                    
                    
                }
                
                else if self.selectedTab == "Карта"{
                    Map()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab).padding(.bottom,edges!.bottom == 0 ? 15 : 0)
            
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}


struct Main1: View {
    @State var alert = false
    @State private var isShowingScanner = false
    @State var UserLogin = UserDefaults.standard.value(forKey: "login") as? String ?? ""
    @ObservedObject var categories = getCategoriesData()
    @ObservedObject var shares = getSharesData()
    @ObservedObject var AllData = getAccountData()
    @ObservedObject var limit : LimitScan
    @State var CuponRandom : Int = 0
    @ObservedObject var UserData : User
    @ObservedObject var BP : Progress
    @State var TodayDate = UserDefaults.standard.value(forKey: "Date") as? Date ?? Date.init(timeIntervalSinceReferenceDate: 86400)
   
    
    var body: some View {
        ZStack{
            
            Image("MainBack").resizable().frame(maxWidth: UIScreen.main.bounds.width , maxHeight: UIScreen.main.bounds.height).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        if self.shares.datas.count != 0{
                        HStack(spacing: 15){
                            
                            ForEach(self.shares.datas){i in
                                GeometryReader{ geometry in
                                    ShareCell(data: i)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                                }
                                .frame(width: 275, height: 275)
                            }
                        }.padding(30)
                    }
                    }.padding(.bottom , 30).clipped().contentShape(Rectangle())
                    HStack{
                    Button(action: {
                        
                        self.isShowingScanner = true
                        
                    }, label: {
                        Image("QR").resizable().frame(width: 120, height: 120 ).padding(.init(top: 10, leading: 5, bottom: 10, trailing: 5))
                        
                    })
                    .clipShape(Rectangle()).cornerRadius(30)
                    .padding(.top, 0)
                    
                        VStack{
                            Text("БОНУСЫ:").font(.custom("gilroy", size: 25)).foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 200, height: 10)
                            
                            DiagramView(bonus: self.BP.BP).padding(.top, 0)
                           
                            Text("\(limit.limit)")
                    Button(action: {
                        if self.BP.BP == 6 || self.BP.BP > 6 {
                            
                            self.BP.BP = 0
                            self.CuponRandom = Int.random(in: 1...5)
                            
                            let db = Firestore.firestore()
                            
                            db.collection("Account").document(self.UserData.UserData.id).updateData(["BonusProgress":Int(0)]) { (err) in
                                
                                if err != nil{
                                    
                                    print((err?.localizedDescription)!)
                                    return
                                }
                                
                            }
                        if CuponRandom  == 1{
                            db.collection("Account").document(self.UserData.UserData.id).updateData(["FirstCupon":Int(self.UserData.UserData.FirstCupon + 1)]) { (err) in
                                
                                if err != nil{
                                    
                                    print((err?.localizedDescription)!)
                                    return
                                }
                                
                            }
                        }
                            else if CuponRandom == 2{
                                db.collection("Account").document(self.UserData.UserData.id).updateData(["SecondCupon":Int(self.UserData.UserData.SecondCupon + 1)]) { (err) in
                                
                                if err != nil{
                                    
                                    print((err?.localizedDescription)!)
                                    return
                                }
                                
                            }
                        }
                            else if CuponRandom == 3{
                                db.collection("Account").document(self.UserData.UserData.id).updateData(["ThirdCupon":Int(self.UserData.UserData.ThirdCupon + 1)]) { (err) in
                                
                                if err != nil{
                                    
                                    print((err?.localizedDescription)!)
                                    return
                                }
                                
                            }
                        }
                            else if CuponRandom == 4{
                                db.collection("Account").document(self.UserData.UserData.id).updateData(["FourthCupon":Int(self.UserData.UserData.FourthCupon + 1)]) { (err) in
                                
                                if err != nil{
                                    
                                    print((err?.localizedDescription)!)
                                    return
                                }
                                
                            }
                        }
                            else if CuponRandom == 5{
                                db.collection("Account").document(self.UserData.UserData.id).updateData(["FifthCupon":Int(self.UserData.UserData.FifthCupon + 1)]) { (err) in
                                
                                if err != nil{
                                    
                                    print((err?.localizedDescription)!)
                                    return
                                }
                                
                            }
                        }
                            
                            self.alert.toggle()
                        }
                    }, label: {
                        Text("ПОЛУЧИТЬ").font(.custom("GILROY-MEDIUM", size: 25)).foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 200)
                    }).background(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .clipShape(Rectangle()).cornerRadius(12)
                    .padding(.top, 0)
                        }
                    }
                }.alert(isPresented: self.$alert) {
                    
                    Alert(title: Text("КУПОН ПОЛУЧЕН"), message: Text("Зайдите в личный кабинет чтобы его аткивировать"), dismissButton: .default(Text("Ok")))
                    
                }
                
                
                
                Menu()
            }.sheet(isPresented: $isShowingScanner, content:{
                        
                        QRcs(id: self.UserData.UserData.id, BP: self.BP, limit: self.limit)})
        }
        .onAppear(){
            self.categories.datas.removeAll()
            let UserLogin = UserDefaults.standard.value(forKey: "login") as? String ?? ""
            self.UserLogin = UserLogin
            
            
            
            
            let db = Firestore.firestore()
            
            db.collection("menu").addSnapshotListener { (snap, err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                for i in snap!.documentChanges{
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let price = i.document.get("price") as! String
                    let pic = i.document.get("pic") as! String
                    let desc = i.document.get("desc") as! String
                    let categ = i.document.get("category") as! String
                    let font = i.document.get("font") as! Int
                    
                    self.categories.datas.append(category(id: id, name: name, price: price, pic: pic, desc: desc, categ: categ, font: font))
                }
            }
            
            self.shares.datas.removeAll()
            db.collection("share").addSnapshotListener { (snap, err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                for i in snap!.documentChanges{
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let pic = i.document.get("pic") as! String
                    let desc = i.document.get("desc") as! String
                    
                    self.shares.datas.append(share(id: id, name: name, pic: pic, desc: desc))
                }
            }
            
            db.collection("Account").addSnapshotListener { (snap, err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                for i in snap!.documentChanges{
                    
                    let id = i.document.documentID
                    let login = i.document.get("login") as! String
                    let FirstCupon = i.document.get("FirstCupon") as! Int
                    let SecondCupon = i.document.get("SecondCupon") as! Int
                    let ThirdCupon = i.document.get("ThirdCupon") as! Int
                    let FourthCupon = i.document.get("FourthCupon") as! Int
                    let FifthCupon = i.document.get("FifthCupon") as! Int
                    let SixthCupon = i.document.get("SixthCupon") as! Int
                    let BonusProgress = i.document.get("BonusProgress") as! Int
                    let Used = i.document.get("Used") as! Int
                    let limit = i.document.get("limit") as! Int
                    let AVA = i.document.get("AVA") as! String
                    
                    
                   
                    
                    self.AllData.datas.append(account(id: id, login: login, FirstCupon: FirstCupon, SecondCupon: SecondCupon, ThirdCupon: ThirdCupon, FourthCupon: FourthCupon, FifthCupon: FifthCupon, SixthCupon: SixthCupon, BonusProgress: BonusProgress, AVA: AVA, Used: Used, limit: limit))
                   
                }
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
                        self.UserData.UserData.limit = i.limit
                        
                        self.BP.BP = self.UserData.UserData.BonusProgress
                        self.limit.limit = self.UserData.UserData.limit

                    }
                }
            }
            
           
                
               
            
              
                let time = Date()
            
            var dateFormatter: DateFormatter {
                let df = DateFormatter()
                df.dateFormat = "d"
                return df
            }
            print(dateFormatter.string(from: self.TodayDate))
            print(dateFormatter.string(from: time))
            
            if  dateFormatter.string(from: self.TodayDate) != dateFormatter.string(from: time) {
                print("sdelal")
                    self.UserData.UserData.limit = 0
                    db.collection("Account").document(self.UserLogin).updateData(["limit": self.UserData.UserData.limit]) { (err) in
                        
                        if err != nil{
                            
                            print((err?.localizedDescription)!)
                            return
                        }
                        
                    }
                   
                
                
                
                UserDefaults.standard.set(time, forKey: "Date")
                
                print(dateFormatter.string(from: self.TodayDate))
                print(dateFormatter.string(from: time))
                }
            
            
            
        }
        
    }
}


struct Menu : View {
    
    @ObservedObject var categories = getCategoriesData()
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Group{
            Spacer().frame(height: UIScreen.main.bounds.height * 0.1)
            
            Text("Меню:").font(.custom("GILROY-MEDIUM", size: 30)).foregroundColor(.black)
            
            Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
            }
           
            
            if self.categories.datas.count != 0{
                
                Group{
                Text("С МОЛОКОМ").font(.custom("GILROY-MEDIUM", size: 25)).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20).padding(.top, 20)
                
                Poloska()
                
                Spacer().frame(height: UIScreen.main.bounds.height * 0.015)
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ForEach(self.categories.datas){i in
                            if i.categ == "СМОЛОКОМ"{
                                
                                CellView(data: i).shadow(color: .init(#colorLiteral(red: 0.6511083841, green: 0.6464042068, blue: 0.6547117829, alpha: 1)), radius: 10, x: 0, y: 20)
                            }
                        }
                    }
                }.frame(height: 250, alignment: .center).padding(.bottom , 30).clipped().contentShape(Rectangle())
                
                Text("БЕЗ МОЛОКА").font(.custom("GILROY-MEDIUM", size: 25)).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20).padding(.top, 20)
               
                Poloska()
                
                Spacer().frame(height: UIScreen.main.bounds.height * 0.015)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ForEach(self.categories.datas){i in
                            if i.categ == "БЕЗМОЛОКА"{
                                
                                CellView(data: i).shadow(color: .init(#colorLiteral(red: 0.6511083841, green: 0.6464042068, blue: 0.6547117829, alpha: 1)), radius: 10, x: 0, y: 20)
                            }
                        }
                    }
                }.frame(height: 250, alignment: .center).padding(.bottom , 30).clipped().contentShape(Rectangle())
                
                Text("СЕЗОННОЕ МЕНЮ").font(.custom("GILROY-MEDIUM", size: 25)).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20).padding(.top, 20)
               
                Poloska()
                
                Spacer().frame(height: UIScreen.main.bounds.height * 0.015)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ForEach(self.categories.datas){i in
                            if i.categ == "СЕЗОННОЕ"{
                                
                                CellView(data: i).shadow(color: .init(#colorLiteral(red: 0.6511083841, green: 0.6464042068, blue: 0.6547117829, alpha: 1)), radius: 10, x: 0, y: 20)
                            }
                        }
                    }
                }.frame(height: 250, alignment: .center).padding(.bottom , 100).clipped().contentShape(Rectangle())
                
                
                
            }
            
            
        }
        
    }
}


struct CellView : View {
    
    @State private var show = false
    @State private var animationAmount = 0.0
    
    var data : category
    
    var body : some View{
        
        
        
        
        Button(action: {
            
            self.show.toggle()
            
            withAnimation{
                self.animationAmount += 180
            }
            
        }, label: {
            
                VStack(alignment: .center,spacing: 5){
                    
                    if show{
                        
                        
                        Text(data.desc).font(.custom("gilroy", size: 10)).frame(width: 116).foregroundColor(.black).rotation3DEffect(.degrees(180), axis: (x:0, y:1, z:0))
                    }
                    
                    else{
                        AnimatedImage(url: URL(string: data.pic)!).resizable().frame(width: 90, height: 140).cornerRadius(10)
                        
                        VStack(alignment: .center, spacing: 5){
                            
                            Text(data.name)
                                .font(.custom("GILROY-HEAVY", size: CGFloat(data.font))).foregroundColor(.black)
                                .lineLimit(1).frame(width: 116 , height: 25 )
                            
                            Text(data.price)
                                .font(.custom("gilroy", size: 25)).foregroundColor(.black)
                                .lineLimit(1)
                            
                            }
                       
                        
                    }
                        
                
                }.padding(.init(top: 2, leading: 2, bottom: 2, trailing: 2)).frame(width: 120, height: 240).background(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).clipShape(Rectangle()).cornerRadius(12)
        
        }).padding(.leading, 5).padding(.trailing, 5).rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
       
        
    }
}



struct ShareCell : View {
    
    @State private var show = false
    @State private var animationAmount = 0.0
    var data : share
    
    var body : some View {
        
        VStack{
            Button(action:{
                self.show.toggle()
                
                withAnimation{
                    self.animationAmount += 180
                }
            }){
                VStack{
                if show {
                    ZStack{
                        Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            VStack{
                
                Text(data.name)
                    .font(.custom("gilroy", size: 10)).foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white).rotation3DEffect(.degrees(180), axis: (x:0, y:1, z:0))
                
                
                Text(data.desc).font(.custom("gilroy", size: 10)).foregroundColor(.gray).frame(maxWidth: .infinity, alignment: .leading).rotation3DEffect(.degrees(180), axis: (x:0, y:1, z:0))
               Spacer().frame(height: 150)
                
            }.padding(.top, 20)
                .padding(.horizontal, 20)
                }
            }
                else {
                    
                    AnimatedImage(url: URL(string: data.pic)!).resizable().aspectRatio(contentMode: .fill).frame(width: 250, height: 250).cornerRadius(30)
                }
            }
            
        }.frame(width: 250, height: 250).cornerRadius(30).shadow(color: .init(#colorLiteral(red: 0.6511083841, green: 0.6464042068, blue: 0.6547117829, alpha: 1)), radius: 30, x: 0, y: 20).rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
        }
    }
}

struct Loader : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
        
    }
}


class getCategoriesData : ObservableObject{
    
    @Published var datas = [category]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("menu").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let price = i.document.get("price") as! String
                let pic = i.document.get("pic") as! String
                let desc = i.document.get("desc") as! String
                let categ = i.document.get("category") as! String
                let font = i.document.get("font") as! Int
                
                self.datas.append(category(id: id, name: name, price: price, pic: pic, desc: desc, categ: categ, font: font))
            }
        }
    }
}


class getSharesData : ObservableObject{
    
    @Published var datas = [share]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("share").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let pic = i.document.get("pic") as! String
                let desc = i.document.get("desc") as! String
                
                self.datas.append(share(id: id, name: name, pic: pic, desc: desc))
            }
        }
    }
}


    
   
    
  
    
   
    
 class getAccountData : ObservableObject{
       
       @Published var datas = [account]()
       
       init() {
           
           let db = Firestore.firestore()
           
           db.collection("Account").addSnapshotListener { (snap, err) in
               
               if err != nil{
                   
                   print((err?.localizedDescription)!)
                   return
               }
               
               for i in snap!.documentChanges{
                   
                   let id = i.document.documentID
                   let login = i.document.get("login") as! String
                   let FirstCupon = i.document.get("FirstCupon") as! Int
                   let SecondCupon = i.document.get("SecondCupon") as! Int
                let ThirdCupon = i.document.get("ThirdCupon") as! Int
                let FourthCupon = i.document.get("FourthCupon") as! Int
                let FifthCupon = i.document.get("FifthCupon") as! Int
                let SixthCupon = i.document.get("SixthCupon") as! Int
                 let BonusProgress = i.document.get("BonusProgress") as! Int
                let Used = i.document.get("Used") as! Int
                let limit = i.document.get("limit") as! Int
                let AVA = i.document.get("AVA") as! String
                
                self.datas.append(account(id: id, login: login, FirstCupon: FirstCupon, SecondCupon: SecondCupon, ThirdCupon: ThirdCupon, FourthCupon: FourthCupon, FifthCupon: FifthCupon, SixthCupon: SixthCupon, BonusProgress: BonusProgress, AVA: AVA, Used: Used, limit: limit))
               }
           }
       }
   }


struct category : Identifiable {
    
    var id : String
    var name : String
    var price : String
    var pic : String
    var desc : String
    var categ : String
    var font : Int
}



struct share : Identifiable {
    
    var id : String
    var name : String
    var pic : String
    var desc : String
}

struct account : Identifiable, Codable{
    var id : String
    var login : String
    var FirstCupon : Int
    var SecondCupon : Int
    var ThirdCupon : Int
    var FourthCupon : Int
    var FifthCupon : Int
    var SixthCupon : Int
    var BonusProgress : Int
    var AVA : String
    var Used : Int
    var limit : Int
}

struct Description: View{
    
    
    var data : category
    
    var body: some View {
        
        
        
        NavigationView {
            
            ScrollView{
                VStack{
                    
                    VStack(alignment: .leading){
                        
                        AnimatedImage(url: URL(string: data.pic)!)
                            .resizable().frame(width: 250, height: 250).cornerRadius(20)
                        Text(data.name).padding(.leading)
                        Text(data.price).padding(.leading)
                        Text(data.desc).padding(.leading)
                        
                        
                        
                        
                       Spacer()
                        
                    }.padding(.init(top: 20, leading: 100, bottom: 30, trailing: 100))
                        .navigationBarTitle("Description")
                    
                    Divider()
                }
            }
        }
    }
}




struct DiagramView: View {
    
    var bonus : Int
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            if bonus == 0{
                Image("progressBarMain0").resizable().frame(width: (UIScreen.main.bounds.width - 150), height: 55, alignment: .leading)
            }
            if bonus == 1{
                Image("progressBarMain1").resizable().frame(width: (UIScreen.main.bounds.width - 150), height: 55, alignment: .leading)
            }
            if bonus == 2{
                Image("progressBarMain2").resizable().frame(width: (UIScreen.main.bounds.width - 150), height: 55, alignment: .leading)
            }
            if bonus == 3{
                Image("progressBarMain3").resizable().frame(width: (UIScreen.main.bounds.width - 150), height: 55, alignment: .leading)
            }
            if bonus == 4{
                Image("progressBarMain4").resizable().frame(width: (UIScreen.main.bounds.width - 150), height: 60, alignment: .leading)
            }
            if bonus == 5{
                Image("progressBarMain5").resizable().frame(width: (UIScreen.main.bounds.width - 150), height: 55, alignment: .leading)
            }
            if bonus == 6{
                Image("progressBarMain6").resizable().frame(width: UIScreen.main.bounds.width - 150, height: 55, alignment: .leading)
            }
            
            
        }
    }
}


struct MainLoader : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<MainLoader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<MainLoader>) {
        
        
    }
}

struct Poloska: View {
    
    var body: some View {
        VStack{
                   ZStack(alignment: .bottom){
                    Rectangle().frame(width: UIScreen.main.bounds.width , height: 3 ).foregroundColor(.black)
                   }.padding(.top,25)
               }
    }
}
