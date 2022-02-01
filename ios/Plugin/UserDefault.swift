import Foundation

@objc public class UserDefault: NSObject {
    private let kFeedbackKey = "com.apple.feedback.managed";
    
    // The Managed app configuration dictionary pushed down from an MDM server are stored in this key.
    private let kConfigurationKey = "com.apple.configuration.managed";
    
    public func readValue(key: String) -> String {
        if let myAppConfig = UserDefaults.standard.dictionary(forKey: kConfigurationKey) {
            if (key == "all") {
                return String(describing: myAppConfig);
            }
            
            return (myAppConfig[key] as? String) ?? "";
        }
        
        return "";
    }
}
