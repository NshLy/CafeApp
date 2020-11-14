//
//  SignIn.swift
//  Cheech
//
//  Created by Артур on 04.10.2020.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignIn: View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @Binding var show1: Int
    @ObservedObject var reset = Reset()
    
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
                    VStack{
                        
                        if UIScreen.main.bounds.height > 750{
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.12)
                        }
                        else{
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.19)
                        }
                        
                        Button(action: {
                            signInWithEmail(email: self.user, password: self.pass) { (verified, status) in
                                
                                if !verified {
                                    
                                    self.message = status
                                    self.alert.toggle()
                                }
                                else{
                                    
                                    
                                    UserDefaults.standard.set(self.user, forKey: "login")
                                    
                                    UserDefaults.standard.set(true, forKey: "status")
                                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                }
                            }
                        }, label: {
                            Text("Войти").font(.custom("gilroy", size: 26)).foregroundColor(.black ).frame(width: UIScreen.main.bounds.width - 160).padding()
                        }).background(Color.init(#colorLiteral(red: 0.9159167409, green: 0.910472095, blue: 0.9201021194, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top, 0)
                        
                        Button(action: {
                            reset.resetPassword()
                        }, label: {
                            Text("Забыли пароль?").font(.custom("gilroy", size: 16)).foregroundColor(.black )
                        })
                    }.alert(isPresented: self.$alert) {
                        
                        Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                    }
                    
                
                if reset.isLoading{
                               
                               LoadingView()
                           }
            
        }
    }
}

class Reset : ObservableObject {
    @Published var isLoading = false
    @Published var alertMsg = ""
    @Published var alert = false
    
func resetPassword(){
          
          let alert = UIAlertController(title: "Вспомнить пароль", message: "Введите ваш email чтобы восстановить пароль!", preferredStyle: .alert)
          
          alert.addTextField { (password) in
              password.placeholder = "Email"
          }
          
          let proceed = UIAlertAction(title: "Восстановить", style: .default) { (_) in
              
              // Sending Password Link...
              
              if alert.textFields![0].text! != ""{
                  
                  withAnimation{
                      
                      self.isLoading.toggle()
                  }
                  
                  Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in
                      withAnimation{
                          self.isLoading.toggle()
                      }
                      if err != nil{
                          self.alertMsg = err!.localizedDescription
                          self.alert.toggle()
                          return
                      }
                      self.alertMsg = "Password Reset Link Has Been Sent !!!"
                      self.alert.toggle()
                  }
              }
          }
    let cancel = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
    alert.addAction(cancel)
    alert.addAction(proceed)
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
}

struct LoadingView : View {
      
      @State var animation = false
      
      var body: some View{
          
          VStack{
              
              Circle()
                  .trim(from: 0, to: 0.7)
                .stroke(Color(.black),lineWidth: 8)
                  .frame(width: 75, height: 75)
                  .rotationEffect(.init(degrees: animation ? 360 : 0))
                  .padding(50)
          }
          .background(Color.white)
          .cornerRadius(20)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
          .onAppear(perform: {
              
              withAnimation(Animation.linear(duration: 1)){
                  
                  animation.toggle()
              }
          })
      }
  }
  
