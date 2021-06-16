import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(UserDefault)
public class UserDefault: CAPPlugin {
    private let kFeedbackKey = "com.apple.feedback.managed";
    
    // The Managed app configuration dictionary pushed down from an MDM server are stored in this key.
    private let kConfigurationKey = "com.apple.configuration.managed";
    
    @objc func getByKey(_ call: CAPPluginCall) {
        let key = call.getString("key") ?? ""
        
        call.success([
            "value": self.readValue(key: key)
        ])
    }
    
    private func readValue(key: String) -> String {
        if let myAppConfig = UserDefaults.standard.dictionary(forKey: kConfigurationKey) {
            if (key == "all") {
                return String(describing: myAppConfig);
            }
            
            return (myAppConfig[key] as? String) ?? "";
        }
        
        return "";
    }
}
