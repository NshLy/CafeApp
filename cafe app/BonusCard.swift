//
//  BonusCard.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//


import SwiftUI
import Foundation

struct FirstCard: View {
    
    @State var show1 = 0
    @State var show2 = 0
    @State var show3 = 0
    @ObservedObject var Scan : ShowScan
    
    var body: some View {
        ZStack{
            
            Image("BonusMain").resizable().frame(width: 350, height: 200, alignment: .center).cornerRadius(12)
            
            HStack(spacing: 0){
                ZStack{
                    if show1 == 1{
                Image("111").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show1 == 2{
                                           Image("112").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show1 == 3{
                        Image("113").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 4{
                                       Image("114").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else if show1 == 0{
                                       Image("010").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else {
                        Image("115").resizable().frame(width: 115, height: 190, alignment: .center)
                            .onAppear(){
                                if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                    self.Scan.Show = true
                                }
                            }
                    }
                   
                    
                }
                
               ZStack{
                if show2 == 1{
            Image("121").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                    else if show2 == 2{
                                       Image("122").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                   
                else if show2 == 3{
                    Image("123").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 4{
                    Image("124").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 0{
                    Image("020").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else{
                    Image("125").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                        if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                            self.Scan.Show = true
                        }
                    }
                }
                
                }
                ZStack{
                    if show3 == 1{
                Image("131").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show3 == 2{
                                           Image("132").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show3 == 3{
                        Image("133").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 4{
                        Image("134").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 0{
                        Image("030").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else{
                        Image("135").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                    
                }
            }
            HStack{
                swipeGesture(show: $show1).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show2).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show3).frame(width: 115, height: 190, alignment: .center)
            }
            
        }
    }
}




struct SecondCard: View {
    
    @State var show1 = 0
    @State var show2 = 0
    @State var show3 = 0
    @ObservedObject var Scan : ShowScan
    
    var body: some View {
        ZStack{
            
            Image("BonusMain").resizable().frame(width: 350, height: 200, alignment: .center).cornerRadius(12)
            
            HStack(spacing: 0){
                ZStack{
                    if show1 == 1{
                Image("211").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show1 == 2{
                                           Image("212").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show1 == 3{
                        Image("213").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 4{
                        Image("214").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 0{
                                       Image("010").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else {
                        Image("215").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                   
                    
                }
                
               ZStack{
                if show2 == 1{
            Image("221").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                    else if show2 == 2{
                                       Image("222").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                   
                else if show2 == 3{
                    Image("223").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 4{
                    Image("224").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 0{
                    Image("020").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else{
                    Image("225").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                        if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                            self.Scan.Show = true
                        }
                    }
                }
                
                }
                ZStack{
                    if show3 == 1{
                Image("231").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show3 == 2{
                                           Image("232").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show3 == 3{
                        Image("233").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 4{
                        Image("234").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 0{
                        Image("030").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else{
                        Image("235").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                    
                }
            }
            HStack{
                swipeGesture(show: $show1).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show2).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show3).frame(width: 115, height: 190, alignment: .center)
            }
            
        }
    }
}


struct ThirdCard: View {
    
    @State var show1 = 0
    @State var show2 = 0
    @State var show3 = 0
    @ObservedObject var Scan : ShowScan
    
    var body: some View {
        ZStack{
            
            Image("BonusMain").resizable().frame(width: 350, height: 200, alignment: .center).cornerRadius(12)
            
            HStack(spacing: 0){
                ZStack{
                    if show1 == 1{
                Image("311").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show1 == 2{
                                           Image("312").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show1 == 3{
                        Image("313").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 4{
                        Image("314").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 0{
                                       Image("010").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else {
                        Image("315").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                   
                    
                }
                
               ZStack{
                if show2 == 1{
            Image("321").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                    else if show2 == 2{
                                       Image("322").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                   
                else if show2 == 3{
                    Image("323").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 4{
                    Image("324").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 0{
                    Image("020").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else{
                    Image("325").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                        if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                            self.Scan.Show = true
                        }
                    }
                }
                
                }
                ZStack{
                    if show3 == 1{
                Image("331").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show3 == 2{
                                           Image("332").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show3 == 3{
                        Image("333").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 4{
                        Image("334").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 0{
                        Image("030").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else{
                        Image("335").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                    
                }
            }
            HStack{
                swipeGesture(show: $show1).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show2).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show3).frame(width: 115, height: 190, alignment: .center)
            }
            
        }
    }
}



struct FourthCard: View {
    
    @State var show1 = 0
    @State var show2 = 0
    @State var show3 = 0
    @ObservedObject var Scan : ShowScan
    
    var body: some View {
        ZStack{
            
            Image("BonusMain").resizable().frame(width: 350, height: 200, alignment: .center).cornerRadius(12)
            
            HStack(spacing: 0){
                ZStack{
                    if show1 == 1{
                Image("411").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show1 == 2{
                                           Image("412").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show1 == 3{
                        Image("413").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 4{
                        Image("414").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 0{
                                       Image("010").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else {
                        Image("415").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                   
                    
                }
                
               ZStack{
                if show2 == 1{
            Image("421").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                    else if show2 == 2{
                                       Image("422").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                   
                else if show2 == 3{
                    Image("423").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 4{
                    Image("424").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 0{
                    Image("020").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else{
                    Image("425").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                        if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                            self.Scan.Show = true
                        }
                    }
                }
                
                }
                ZStack{
                    if show3 == 1{
                Image("431").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show3 == 2{
                                           Image("432").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show3 == 3{
                        Image("433").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 4{
                        Image("434").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 0{
                        Image("030").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else{
                        Image("435").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                    
                }
            }
            HStack{
                swipeGesture(show: $show1).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show2).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show3).frame(width: 115, height: 190, alignment: .center)
            }
            
        }
    }
}


struct FifthCard: View {
    
    @State var show1 = 0
    @State var show2 = 0
    @State var show3 = 0
    @ObservedObject var Scan : ShowScan
    
    var body: some View {
        ZStack{
            
            Image("BonusMain").resizable().frame(width: 350, height: 200, alignment: .center).cornerRadius(12)
            
            HStack(spacing: 0){
                ZStack{
                    if show1 == 1{
                Image("511").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show1 == 2{
                                           Image("512").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show1 == 3{
                        Image("513").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 4{
                        Image("514").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 0{
                                       Image("010").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else {
                        Image("515").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                   
                    
                }
                
               ZStack{
                if show2 == 1{
            Image("521").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                    else if show2 == 2{
                                       Image("522").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                   
                else if show2 == 3{
                    Image("523").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 4{
                    Image("524").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 0{
                    Image("020").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else{
                    Image("525").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                        if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                            self.Scan.Show = true
                        }
                    }
                }
                
                }
                ZStack{
                    if show3 == 1{
                Image("531").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show3 == 2{
                                           Image("532").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show3 == 3{
                        Image("533").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 4{
                        Image("534").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 0{
                        Image("030").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else{
                        Image("535").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                    
                }
            }
            HStack{
                swipeGesture(show: $show1).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show2).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show3).frame(width: 115, height: 190, alignment: .center)
            }
            
        }
    }
}



struct SixthCard: View {
    
    @State var show1 = 0
    @State var show2 = 0
    @State var show3 = 0
    @ObservedObject var Scan : ShowScan
    
    var body: some View {
        ZStack{
            
            Image("BonusMain").resizable().frame(width: 350, height: 200, alignment: .center).cornerRadius(12)
            
            HStack(spacing: 0){
                ZStack{
                    if show1 == 1{
                Image("611").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show1 == 2{
                                           Image("612").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show1 == 3{
                        Image("613").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 4{
                        Image("614").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show1 == 0{
                                       Image("010").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                    else {
                        Image("615").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                   
                    
                }
                
               ZStack{
                if show2 == 1{
            Image("621").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                    else if show2 == 2{
                                       Image("622").resizable().frame(width: 115, height: 190, alignment: .center)
                                            }
                   
                else if show2 == 3{
                    Image("623").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 4{
                    Image("624").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else if show2 == 0{
                    Image("020").resizable().frame(width: 115, height: 190, alignment: .center)
                }
                else{
                    Image("625").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                        if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                            self.Scan.Show = true
                        }
                    }
                }
                
                }
                ZStack{
                    if show3 == 1{
                Image("631").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                        else if show3 == 2{
                                           Image("632").resizable().frame(width: 115, height: 190, alignment: .center)
                                                }
                       
                    else if show3 == 3{
                        Image("633").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 4{
                        Image("634").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else if show3 == 0{
                        Image("030").resizable().frame(width: 115, height: 190, alignment: .center)
                    }
                    else{
                        Image("635").resizable().frame(width: 115, height: 190, alignment: .center) .onAppear(){
                            if (show1 > 4)&&(show2 > 4)&&(show3 > 4){
                                self.Scan.Show = true
                            }
                        }
                    }
                    
                }
            }
            HStack{
                swipeGesture(show: $show1).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show2).frame(width: 115, height: 190, alignment: .center)
                swipeGesture(show: $show3).frame(width: 115, height: 190, alignment: .center)
            }
            
        }
    }
}


struct swipeGesture: UIViewRepresentable{
    
    @Binding var show : Int
    
    func makeCoordinator() -> swipeGesture.Coordinator {
        return swipeGesture.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<swipeGesture>) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        let left =  UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.left))
        left.direction = .left
        let right =  UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.right))
        right.direction = .right
        let down =  UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.down))
        down.direction = .down
        let up =  UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.up))
        up.direction = .up
        
        view.addGestureRecognizer(up)
        view.addGestureRecognizer(down)
        view.addGestureRecognizer(left)
        view.addGestureRecognizer(right)
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<swipeGesture>) {
        
    }
    
    class Coordinator : NSObject{
        
        var parent : swipeGesture
        init(parent1 : swipeGesture){
            parent = parent1
        }
        
        @objc func left(){
            parent.show = parent.show + 1
        }
        @objc func down(){
            parent.show = parent.show + 1
        }
        @objc func up(){
            parent.show = parent.show + 1
        }
        @objc func right(){
            parent.show = parent.show + 1
        }
        
        
    }
}


