//
//  ContentView.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//
import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var login = UserDefaults.standard.value(forKey: "login") as? String ?? ""
    @State var TodayDate = UserDefaults.standard.value(forKey: "Date") as? Date ?? Date()
    
    var body: some View {
        
        VStack{
            
            if status{
                
                Main()
            }
            else{
                
                Home()
            }
        }.animation(.spring())
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("TodayDateChange"), object: nil, queue: .main) { (_) in
                
                let TodayDate = UserDefaults.standard.value(forKey: "Date") as? Date ?? Date()
                self.TodayDate = TodayDate
            }
            NotificationCenter.default.addObserver(forName: NSNotification.Name("loginChange"), object: nil, queue: .main) { (_) in
                
                let login = UserDefaults.standard.value(forKey: "login") as? String ?? ""
                self.login = login
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



func signInWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    
    Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}

func signUpWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    
    Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}




struct Home: View {
    
    @ObservedObject var log = Shower()
    
    var body: some View {
        VStack{
            
            if self.log.show1 == 0 {
              
                ZStack{
                   
                    Image("FirstBack").resizable().frame(maxWidth: UIScreen.main.bounds.width , maxHeight: UIScreen.main.bounds.height).edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Image("chch1").resizable().frame(width:  UIScreen.main.bounds.width * 0.75, height:  UIScreen.main.bounds.width * 0.4 ).clipShape(Rectangle())
                        Spacer().frame(height:  UIScreen.main.bounds.height * 0.5)
                    }
                    
                    VStack{
                        
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.45)
                        
                        Button(action: {
                            
                            self.log.show1 = self.log.show1 + 1
                            
                        }, label: {
                            
                            Text("Войти").font(.custom("gilroy", size: 26)).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 80).padding()
                        }).background(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .clipShape(Capsule())
                        
                        .padding(.init(top: 0, leading: 0, bottom: 15, trailing: 0))
                        
                        Button(action: {
                            self.log.show1 = self.log.show1 + 2
                        }, label: {
                            
                            Text("Регистрация").font(.custom("gilroy", size: 26)).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 80).padding()
                            
                        }).background(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top, 0)
                        
                    
                    
                    }
                }
            }
            else if self.log.show1 == 1{
                SignIn(show1: self.$log.show1)
            }
            else {
                SignUp(show1: self.$log.show1)
            }
        }.onAppear{
            self.log.show1 = 0
        }
    }
}
