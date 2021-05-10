import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(UserDefault)
public class UserDefault: CAPPlugin {
    // The Managed app configuration dictionary pushed down from an MDM server are stored in this key.
    static let MDMConfigurationKey = "com.apple.configuration.managed";
    
    @objc func getByKey(_ call: CAPPluginCall) {
        let key = call.getString("key") ?? ""
        
        call.success([
            "value": self.readValue(key)
        ])
    }
    
    private func readValue(_ key: String) -> String {
        let dict = UserDefaults.init(suiteName: UserDefault.MDMConfigurationKey);
    
    
        return dict?.string(forKey: key) ?? "";
    }
}
