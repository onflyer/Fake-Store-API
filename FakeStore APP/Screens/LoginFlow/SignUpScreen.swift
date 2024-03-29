//
//  SignUpScreen.swift
//  FakeStore APP
//
//  Created by Aleksandar Milidrag on 1/13/24.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject var session: SessionManager
    @StateObject private var manager = AuthManager(httpClient: HTTPClient())
    @State private var showPreviousButton: Bool = false
    @State private var isRegistering: Bool = false
    
    
    var body: some View {
        ZStack {
            TabView(selection: $manager.active) {
                NameView1(placeholder: "Please enter your name", errorPrompt: $manager.validationError, isNotValid: $manager.isNotValid, text: $manager.user.name, action: {
                    manager.validateName()
                    if !manager.isNotValid {
                        manager.next()
                        
                    }
                })
                .tag(AuthManager.Screen.name)
                .onChange(of: manager.user.name) {
                    manager.validateName()
                }
                
                EmailView1(placeholder: "Please enter your Email", errorPrompt: $manager.validationError, isNotValid: $manager.isNotValid, text: $manager.user.email, action: {
                    manager.validateEmail()
                    if !manager.isNotValid {
                        manager.next()
                    }
                })
                    .tag(AuthManager.Screen.email)
                    .onChange(of: manager.user.email) {
                        manager.validateEmail()
                    }
                
                PasswordView1(placeholder: "Please enter your password", errorPrompt: $manager.loginError, isNotValid: $manager.isNotValid, isSecure: $manager.isSecure, text: $manager.user.password, isRegistering: $isRegistering) {
                    manager.validatePassword()
                    
                    print(manager.user)
                    if !manager.isNotValid {
                        isRegistering = true
                        Task {
                            try await manager.loadCreateUser()
                            isRegistering = false
                            guard !manager.hasError else {
                                return
                            }
                            session.register()
                        }
                    }
                }
                .tag(AuthManager.Screen.password)
                .onChange(of: manager.user.password) {
                    manager.validatePassword()
                }
                
            }
            .animation(.easeInOut, value: manager.active)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .animation(.easeInOut, value: isRegistering)

        .ignoresSafeArea()
        .overlay(alignment: .topLeading, content: {
            if showPreviousButton {
                Button(action: {
                    manager.previous()
                    manager.validationError = nil
                    manager.isNotValid = false
                }, label: {
                    Image(systemName: "chevron.backward")
                        .symbolVariant(.circle.fill)
                        .foregroundStyle(.white)
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .padding()
            })
            }
        })
        .animation(.easeInOut, value: showPreviousButton)
        .onAppear {
            UIScrollView.appearance().isScrollEnabled = false
        }
        .onDisappear {
            UIScrollView.appearance().isScrollEnabled = true
        }
        .onChange(of: manager.active) { oldValue, newValue in
            if newValue == AuthManager.Screen.allCases.first {
                showPreviousButton = false
            } else {
                showPreviousButton = true
            }
        }
        
    }
}

#Preview {
    SignUpScreen()
        .environmentObject(SessionManager())
}
