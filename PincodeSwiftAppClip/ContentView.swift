//
//  ContentView.swift
//  PincodeSwiftAppClip
//
//  Created by Raja Rahul on 21/09/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import SwiftUI
import IBMMobileFirstPlatformFoundation

struct ContentView: View {
    var body: some View {
        Text("Hello, User!")
            .padding()
        Button("Get Balance", action: {
            print("Hello World tapped!")
            
            let request = WLResourceRequest(url: URL(string: "/adapters/ResourceAdapter/balance"), method: WLHttpMethodGet)
            request?.send { (response, error) -> Void in
                if(error == nil){
                    print((response?.responseText)!)
                    let alert = UIAlertController(title: "Balance",
                        message: (response?.responseText)!,
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) -> Void in
                    }))
                    DispatchQueue.main.async {
                        let topController = UIApplication.shared.keyWindow!.rootViewController! as UIViewController
                        topController.present(alert,
                            animated: true,
                            completion: nil)
                    }
                }
                else{
                    print(error.debugDescription)
                }
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
