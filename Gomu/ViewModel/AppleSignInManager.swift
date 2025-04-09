////
////  AppleSignInManager.swift
////  Gomu
////
////  Created by Franco Antonio Pranata on 08/04/25.
////
//
//import AuthenticationServices
//import SwiftUI
//
//class AppleSignInManager: NSObject, ObservableObject {
//    private var userIDKey = "appleUserID"
//    @AppStorage("isSignedIn") var isSignedIn: Bool = false
//    
//    func logout() {
//        isSignedIn = false
//    }
//    
//    override init() {
//        super.init()
//        performSilentLogin()
//    }
//    
//    func performSilentLogin() {
//        guard let userID = UserDefaults.standard.string(forKey: userIDKey) else {
//            requestAppleSignIn()
//            return
//        }
//        
//        ASAuthorizationAppleIDProvider().getCredentialState(forUserID: userID) { state, _ in
//            DispatchQueue.main.async {
//                switch state {
//                case .authorized:
//                    self.isSignedIn = true
//                default:
//                    self.requestAppleSignIn()
//                }
//            }
//        }
//    }
//    
//    func requestAppleSignIn() {
//        let provider = ASAuthorizationAppleIDProvider()
//        let request = provider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//        
//        let controller = ASAuthorizationController(authorizationRequests: [request])
//        controller.delegate = self
//        controller.presentationContextProvider = self
//        controller.performRequests()
//    }
//}
//
//extension AppleSignInManager: ASAuthorizationControllerDelegate {
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            let userID = credential.user
//            UserDefaults.standard.set(userID, forKey: userIDKey)
//            DispatchQueue.main.async {
//                self.isSignedIn = true
//            }
//        }
//    }
//    
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        print("❌ Apple Sign-In Error: \(error.localizedDescription)")
//    }
//}
//
//extension AppleSignInManager: ASAuthorizationControllerPresentationContextProviding {
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return UIApplication.shared.windows.first { $0.isKeyWindow } ?? ASPresentationAnchor()
//    }
//}
