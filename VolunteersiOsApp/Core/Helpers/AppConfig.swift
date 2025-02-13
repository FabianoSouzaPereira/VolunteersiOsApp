import Foundation
import Combine

class AppConfig: ObservableObject {
    private let userDefaults = UserDefaults.standard
    
    @Published var isUsingFirebaseState: Bool
    @Published var baseUrlState: String

    var isUsingFirebase: Bool {
        get { isUsingFirebaseState }
        set {
            isUsingFirebaseState = newValue
            saveState(isUsing: newValue)
        }
    }

    var baseUrl: String {
        get { baseUrlState }
        set {
            baseUrlState = newValue
            setBaseUrlState(isUsing: newValue)
        }
    }

    init(initialState: Bool) {
        self.isUsingFirebaseState = initialState
        self.baseUrlState = ""
        
        // Carregar valores armazenados
        self.isUsingFirebaseState = userDefaults.bool(forKey: "is_using_firebase")
        self.baseUrlState = userDefaults.string(forKey: "baseUrl") ?? ""
    }

    private func setBaseUrlState(isUsing: String) {
        baseUrlState = isUsing
        userDefaults.set(isUsing, forKey: "baseUrl")
    }

    private func saveState(isUsing: Bool) {
        userDefaults.set(isUsing, forKey: "is_using_firebase")
    }

    func getBaseUrlState() -> String {
        return userDefaults.string(forKey: "baseUrl") ?? ""
    }

    func getIsUsingFirebase() -> Bool {
        return userDefaults.bool(forKey: "is_using_firebase")
    }

    func saveAdminClaim(adminClaim: Bool) {
        userDefaults.set(adminClaim, forKey: "adminClaim")
    }

    func getAdminClaim() -> Bool {
        return userDefaults.bool(forKey: "adminClaim")
    }
}
