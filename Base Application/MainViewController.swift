//
//  ViewController.swift
//  Base Application
//
//  Created by Ahsanul Kabir on 17/2/21.
//  Copyright © 2021 sakibwrold. All rights reserved.
//

import UIKit
import Intents
import IntentsUI


class MainViewController: UIViewController{
   
    

    @IBOutlet weak var helloTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        helloTextLabel.text = "Hello".localize()
        addSiriButton(to: self.view)
    }
    
    // Add an "Add to Siri" button to a view.
    func addSiriButton(to view: UIView) {
        let button = INUIAddVoiceShortcutButton(style: .blackOutline)
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(button)
        view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true

       button.addTarget(self, action: #selector(addToSiri(_:)), for: .touchUpInside)
    }

    // Present the Add Shortcut view controller after the
    // user taps the "Add to Siri" button.
    @objc
    func addToSiri(_ sender: Any) {
        let intent = ShortcutIntent()
        intent.name = "Sakib"
        intent.id = "id"
        intent.suggestedInvocationPhrase = "ki ar suggestion dibo"
        if let shortcut = INShortcut(intent: intent) {
            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            viewController.modalPresentationStyle = .formSheet
            viewController.delegate = self // Object conforming to `INUIAddVoiceShortcutViewControllerDelegate`.
            present(viewController, animated: true, completion: nil)
        }
    }
}


extension MainViewController:INUIAddVoiceShortcutViewControllerDelegate{
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        print("")
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        print("")
        controller.dismiss(animated: true, completion: nil)
    }
}
