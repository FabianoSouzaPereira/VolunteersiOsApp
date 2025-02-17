
## **Diferenças e Ajustes para Swift**

[![Swift Version](https://img.shields.io/badge/swift-5.9-orange)](https://swift.org) [![Build Status](https://travis-ci.com/usuario/repositorio.svg?branch=main)](https://travis-ci.com/usuario/repositorio) [![License](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT) [![Downloads](https://img.shields.io/github/downloads/usuario/repositorio/total)](https://github.com/usuario/repositorio/releases)
![Swinject Version](https://img.shields.io/badge/Swinject-2.9.1-blue) ![Swinject Version](https://img.shields.io/badge/Alamofire-5.10.2-blue) ![Swinject Version](https://img.shields.io/badge/Firebaser-11.8.1-blue)



O **SwiftUI** usa **DAO** geralmente via *CoreData*, então a camada *Persistence* foi nomeada para refletir isso.
**Use Cases** são comuns em arquiteturas limpas no Swift.
**Repositories** seguem a mesma lógica, separando interfaces do domínio e implementações na camada de dados.
A camada de *UI* foi separada por *Screens* e *Components*, o que ajuda na reutilização de elementos visuais no *SwiftUI*.
A injeção de dependências pode ser feita com **Swinjection** frameworks ou manualmente usando **@StateObject** e **@EnvironmentObject**.

```
    App
    │
    ├── Core
    │   ├── DI
    │   │   ├── AppModule.swift  // Módulos globais de injeção de dependências
    │   │   ├── NetworkModule.swift 
    │   │   ├── CoreModule.swift // Configurações globais (ex.: UserDefaults, serviços globais)
    │   │   ├── DataModule.swift 
    │   │   ├── FirebaseModule.swift 
    │   │  
    │   ├── Navigation
    │   │   ├── Router.swift 
    │   │   ├── Screen.swift 
    │   │  
    │   ├── Helpers
    │   │   ├── AppConfig.swift 
    │   │   ├── DefaultRetryController.swift 
    │   │   ├── RetryControllerProtocol.swift 
    │   │   
    │   ├── Extensions            // Extensões auxiliares para reutilização de código
    │   ├── Utils                 // Utilitários e helpers globais
    │     
    ├── features
    │   ├── Commons
    │   │   ├── Data
    │   │   │   ├── Models
    │   │   │
    │   │   ├── Domain
    │   │       ├── Entities
    │   │
    │   ├── Splash.swift
    │   ├── Login
    │   │   ├── Data
    │   │   │   ├── Datasources
    │   │   │   │   ├── DatasourceImpl.swift     (implementation)
    │   │   │   ├── Persistence
    │   │   │   ├── Repositories
    │   │   │       ├── LoginReposiotyImpl.swift (implementation)
    │   │   │
    │   │   ├── Models
    │   │   │   ├── LoginModel.swift  (implementation)
    │   │   │
    │   │   ├── Repositories
    │   │   │   ├── LoginReposiotyImpl.swift  (implementation)
    │   │   │   
    │   │   ├── Domain
    │   │   │   ├── Entities
    │   │   │   │    ├── LoginEntities   (protocol)
    │   │   │   │
    │   │   │   ├── DataSources
    │   │   │   │   ├── LoginDatasource.swift (protocol)
    │   │   │   │
    │   │   │   ├── LoginRepositories   
    │   │   │   │   ├── LoginReposioty.swift  (protocol)
    │   │   │   │
    │   │   │   ├── UseCases
    │   │   │       ├── LoginUseCase     (protocol)
    │   │   │       ├── LoginUseCaseImpl (implementation)
    │   │   │
    │   │   ├── Presentation
    │   │   │   ├── AuthManager.swift
    │   │   │   ├── Screens
    │   │   │   │   ├── LoginView.swift
    │   │   │   │   ├── LoginViewModel.swift
    │   │   │   │   ├── LoginState.swift
    │   │   │   │   ├── LoginErrorView.swift
    │   │   │   ├── Components   // Componentes reutilizáveis de UI (botões, inputs, etc.)
    │   │   │   ├── Themes       // Definição de temas e estilos globais
    │   │   │   
    │   │   ├── DI
    │   │       ├── LoginModule.swift
    │   │
    │   ├── Home
    │   ├── User
    │   ├── Settings
    │
    ├── VolunteersiOsApp.swift // Entry point do app (substitui AppDelegate)

```

## **Entities**

### **Codable e Protocolos Genéricos**

O Encodable e Decodable (ou seja, Codable) não funcionam diretamente com protocolos com any, já que o compilador do Swift não consegue inferir automaticamente como serializar e desserializar essas propriedades que usam any.

#### **Tornar o protocolo UserEntity genérico**

A abordagem utilizada foi transformar UserEntity em um protocolo genérico, removendo any e garantindo que UserModel use tipos específicos para suas propriedades.

```swift
protocol UserEntity {
    associatedtype AddressType: UserAddressEntity
    associatedtype PhonesType: UserPhonesEntity
    associatedtype SocialMediaType: UserSocialMediaEntity
    associatedtype NotificationSettingsType: UserNotificationSettingsEntity

    var id: String { get }
    var profilePicture: URL? { get }
    var email: String { get }
    var username: String { get }
    var address: AddressType { get }
    var phones: PhonesType { get }
    var socialmedia: SocialMediaType { get }
    var notificationSettings: NotificationSettingsType { get }
    var lastLogin: Date { get }
    var isActive: Bool { get }
    var createdAt: Date { get }
}
```

### **Implementação Segura**

Foi criada uma implementação mais segura, permitindo que o Swift gere os métodos de Codable corretamente.

```swift
struct UserModel: UserEntity, Codable {
    var id: String
    var profilePicture: URL?
    var email: String
    var username: String
    var address: UserAddressModel
    var phones: UserPhonesModel
    var socialmedia: UserSocialMediaModel
    var notificationSettings: UserNotificationSettingsModel
    var lastLogin: Date
    var isActive: Bool
    var createdAt: Date
}
```

### **Métodos de Serialização**

```swift
extension UserModel {
    static func fromJson(_ jsonData: Data) throws -> UserModel {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(UserModel.self, from: jsonData)
    }

    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
```

### **Tratamento de Erros**

```swift
static func fromJson(_ jsonData: Data) -> Result<UserModel, Error> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    do {
        let decodedUser = try decoder.decode(UserModel.self, from: jsonData)
        return .success(decodedUser)
    } catch {
        return .failure(error)
    }
}
```

```swift
func toJson() -> Result<Data, Error> {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    
    do {
        let jsonData = try encoder.encode(self)
        return .success(jsonData)
    } catch {
        return .failure(error)
    }
}
```

Essa abordagem melhora a robustez e evita crashes inesperados no app.

