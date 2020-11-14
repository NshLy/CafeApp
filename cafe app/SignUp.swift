//
//  SignUp.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct SignUp: View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var politica = false
    @State var politicaurl = false
    @Binding var show1: Int
    
    var body: some View {
        
       
            
            ZStack{
                
               
                
                   
                Image("LogBack").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).edgesIgnoringSafeArea(.all)
                
                
                
                VStack{
                    Image("chch1").resizable().frame(width:  UIScreen.main.bounds.width * 0.55, height:  UIScreen.main.bounds.width * 0.3 ).clipShape(Rectangle())
                    if UIScreen.main.bounds.height > 750{
                        Spacer().frame(height:  UIScreen.main.bounds.height * 0.6)
                    }
                    else{
                        Spacer().frame(height:  UIScreen.main.bounds.height * 0.65)
                    }
                   
                }
                
                VStack{
                    
                    HStack{
                        
                        Button(action:{
                            
                            self.show1 = 0
                        },label:{
                            Image(systemName: "arrow.backward.circle").resizable().font(.headline).frame(width: 25, height: 25).accentColor(.black)
                        })
                        Spacer().frame(width: UIScreen.main.bounds.width * 0.85)
                    }
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.85)
                }
                    
                VStack {
                   
                    TextField("Логин", text: self.$user).font(.custom("gilroy", size: 26)).foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 80).padding().background(Color.init(#colorLiteral(red: 0.9159167409, green: 0.910472095, blue: 0.9201021194, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top, 0)
                    if UIScreen.main.bounds.height > 750{
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.3)
                    }
                    else{
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.3)
                    }
                }
                VStack {
                      
                      SecureField("Пароль", text: self.$pass).font(.custom("gilroy", size: 26)).foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 80).padding().background(Color.init(#colorLiteral(red: 0.9159167409, green: 0.910472095, blue: 0.9201021194, alpha: 1)))
                          .clipShape(Capsule())
                          .padding(.top, 0)
                      if UIScreen.main.bounds.height > 750{
                      Spacer().frame(height: UIScreen.main.bounds.height * 0.1)
                      }
                      else{
                          Spacer().frame(height: UIScreen.main.bounds.height * 0.08)
                      }
                  }
                    
                    VStack{
                        
                        if UIScreen.main.bounds.height > 750{
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.13)
                        }
                        else{
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.2)
                        }
                        
                        Button(action: {
                            signUpWithEmail(email: self.user, password: self.pass) { (verified, status) in
                                
                                if !verified{
                                    
                                    self.message = status
                                    self.alert.toggle()
                                    
                                }
                                else{
                                    
                                    let db = Firestore.firestore()
                                    db.collection("Account")
                                        .document("\(self.user)")
                                        .setData(["login": self.user,"BonusProgress": 0,"FirstCupon": 0,"SecondCupon": 0, "ThirdCupon": 0, "FourthCupon": 0, "FifthCupon": 0, "SixthCupon": 0, "AVA": "Ava1", "Used": 0, "limit": 0]) { (err) in
                                           
                                            if err != nil{
                                                
                                                print((err?.localizedDescription)!)
                                                return
                                            }
                                            
                                          
                                            
                                            UserDefaults.standard.set(self.user, forKey: "login")
                                            UserDefaults.standard.set(true, forKey: "status")
                                            
                                            
                                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                            
                                            
                                        }
                                }
                            }
                        }, label: {
                            Text("Войти").font(.custom("gilroy", size: 26)).foregroundColor(.black ).frame(width: UIScreen.main.bounds.width - 160).padding()
                        }).background(Color.init(#colorLiteral(red: 0.9159167409, green: 0.910472095, blue: 0.9201021194, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top, 0)
                    }
                    
                    
                    VStack{
                        if UIScreen.main.bounds.height > 750{
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                        }
                        else{
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.06)
                        }
                        HStack{
                            Button(action: {
                                self.politica.toggle()
                            }, label: {

                                if self.politica == false{
                                    Image(systemName: "checkmark.circle.fill").resizable().font(.headline).frame(width: 20, height: 20).accentColor(.black)
                                }
                                else {
                                    Image(systemName: "checkmark.circle.fill").resizable().font(.headline).frame(width: 20, height: 20).accentColor(.blue)
                                }

                            })

                            Text("Я принимаю").font(.custom("gilroy", size: 14)).foregroundColor(.black).lineLimit(1)
                            Button(action: {

                                self.politicaurl.toggle()
                                if let url = URL(string: "https://www.vk.com/watersamurai") {
                                    UIApplication.shared.open(url)
                                }

                            }, label: {
                                Text("условия конфиденциальности").font(.custom("gilroy", size: 14)).foregroundColor(.blue).lineLimit(1)
                            })
                        }

                    }
                    
            }
        }
        
    
}




    
