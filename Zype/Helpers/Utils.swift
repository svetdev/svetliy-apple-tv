//
//  Utils.swift
//  Zype
//
//  Created by Eugene Lizhnyk on 10/23/15.
//  Copyright © 2015 Eugene Lizhnyk. All rights reserved.
//

import UIKit
import ZypeAppleTVBase

func localized(_ key: String) -> String {
  return NSLocalizedString(key, comment: "")
}

func getAppDelegate() -> AppDelegate {
  return UIApplication.shared.delegate as! AppDelegate
}

func alert(_ message: String, title: String = "", action: (()->())? = nil) {
  let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
  let acceptAction = UIAlertAction(title: localized("Messages.OK"), style: .default) { _ in
    if(action != nil){
      action!()
    }
  }
  alertController.addAction(acceptAction)
  getAppDelegate().window?.rootViewController!.present(alertController, animated: true, completion: nil)
}

func errorAlert(_ message: String) {
  alert(message, title: localized("Messages.ErrorTitle"))
}

func errorDescription(_ error: NSError) -> String {
  var descriptionKey: String
  if(error.domain == kErrorDomaine) {
    switch error.code {
    case kErrorIncorrectLoginParameters:
      descriptionKey = "Errors.ZYPE.Common"
    case kErrorConsumerNotLoggedIn:
      descriptionKey = "Errors.ZYPE.kErrorConsumerNotLoggedIn"
    case kErrorItemNotInFavorites:
      descriptionKey = "Errors.ZYPE.kErrorItemNotInFavorites"
    default:
      descriptionKey = "Errors.ZYPE.Common"
    }
    return error.localizedDescription.isEmpty ? localized(descriptionKey) : error.localizedDescription
  } else if(error.domain == NSURLErrorDomain) {
    return error.localizedDescription
  }
  return error.localizedDescription.isEmpty ? localized("Errors.Common") : error.localizedDescription
}

func displayError(_ error: NSError?){
  let description = error == nil ? localized("Errors.ZYPE.Common") : errorDescription(error!)
  errorAlert(description)
}

func showModalProgress(_ text: String? = nil){
  if let rootVC = getAppDelegate().window?.rootViewController {
    let modalVC = rootVC.storyboard?.instantiateViewController(withIdentifier: "ModalProgressVC") as! ModalProgressVC
    modalVC.modalPresentationStyle = .custom
    modalVC.text = text ?? localized("Progress.Default")
    rootVC.present(modalVC, animated: true, completion: nil)
  }
}

func hideModalProgress(){
  if let rootVC = getAppDelegate().window?.rootViewController {
    rootVC.dismiss(animated: true, completion: nil)
  }
}

func isFirstLaunch() -> Bool {
  let defaults = UserDefaults.standard
  let isFirstLaunch = !UserDefaults.standard.bool(forKey: "wasFirstLaunch")
  defaults.set(true, forKey: "wasFirstLaunch")
  defaults.synchronize()
  return isFirstLaunch
}

func isValidEmail(_ email:String) -> Bool {
  let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
  let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
  return emailTest.evaluate(with: email)
}
