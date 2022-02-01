import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(UserDefaultPlugin)
public class UserDefaultPlugin: CAPPlugin {
    private let implementation = UserDefault()
    
    @objc func getByKey(_ call: CAPPluginCall) {
        let key = call.getString("key") ?? ""
        
        call.resolve([
            "value": implementation.readValue(key: key)
        ])
    }
}
