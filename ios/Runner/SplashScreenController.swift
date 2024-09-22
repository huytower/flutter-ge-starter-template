//
//  SplashScreenController.swift
//  Runner
//
//  Created by Thanh Tuấn on 11/10/2022.
//

import UIKit
import Lottie
import Foundation 

public class SplashScreenController: UIViewController {

    private var animationView: LottieAnimationView?

    public override func viewDidAppear(_ animated: Bool) {
            let width = UIScreen.main.bounds.size.width / 2.5
            let x = view.bounds.midX - (width * 0.5)
            let y = view.bounds.midY - (width * 0.5)
           animationView = .init(name: "splash_screen")
           animationView!.frame = view.bounds
           animationView!.frame = CGRect(x: x, y: y, width:width, height:width)
           animationView!.contentMode = .scaleAspectFit
           animationView!.loopMode = .playOnce
           animationView!.animationSpeed = 3.00
           view.addSubview(animationView!)
           animationView!.play{ (finished) in
               self.startFlutterApp()
           }
       }

    func startFlutterApp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let flutterEngine = appDelegate.flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

        flutterViewController.modalPresentationStyle = .custom
        flutterViewController.modalTransitionStyle = .crossDissolve

        present(flutterViewController, animated: true, completion: nil)

    }
}
