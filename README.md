
## **Diferenças e Ajustes para Swift**

[![Swift Version](https://img.shields.io/badge/swift-5.9-orange)](https://swift.org) [![License](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT) [![Downloads](https://img.shields.io/github/downloads/usuario/repositorio/total)](https://github.com/usuario/repositorio/releases)
![Swinject Version](https://img.shields.io/badge/Swinject-2.9.1-blue) ![Alamofire Version](https://img.shields.io/badge/Alamofire-5.10.2-blue) ![Firebase Version](https://img.shields.io/badge/Firebase-11.8.1-blue)

O **SwiftUI** utiliza **DAO** comumente através do *CoreData*, então a camada de *Persistence* foi nomeada para refletir essa abordagem.

- **Use Cases** são implementados seguindo os padrões da Clean Architecture.
- **Repositories** separam as interfaces de domínio de suas implementações na camada de dados.
- A camada de **UI** foi segmentada por **Screens** e **Components**, facilitando a reutilização e a modularidade no SwiftUI.
- A **injeção de dependências** é feita via **Swinject** ou manualmente com `@StateObject`, `@ObservedObject` e `@EnvironmentObject`.





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
    │   │   ├── Exceptions
    │   │   │   ├── RequestError.swift
    │   │   │   ├── GeneralRequestError.swift
    │   │   │   ├── NetworkError.swift
    │   │   │   ├── UserError.swift
    │   │   │   ├── TransactionError.swift
    │   │   │   ├── ErrrorHandle.swift
    │   │   │
    │   │   ├── AppConfig.swift 
    │   │   ├── DefaultRetryController.swift 
    │   │   ├── RetryControllerProtocol.swift 
    │   │   ├── TokenManager.swift 
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
    │   │   │   │   ├── LoginRemoteDatasourceImpl.swift     (implementation)
    │   │   │   │   ├── LoginFirebaseDatasourceImpl.swift     (implementation)
    │   │   │   │
    │   │   │   ├── Persistence
    │   │   │   ├── Repositories
    │   │   │       ├── LoginReposiotyImpl.swift (implementation)
    │   │   │
    │   │   ├── Models
    │   │   │   ├── LoginModel.swift  (implementation)
    │   │   │   ├── LoginFirebaseModel.swift  (implementation)
    │   │   │
    │   │   ├── Repositories
    │   │   │   ├── LoginReposiotyImpl.swift  (implementation)
    │   │   │   
    │   │   ├── Domain
    │   │   │   ├── Entities
    │   │   │   │    ├── LoginEntities   (protocol)
    │   │   │   │
    │   │   │   ├── DataSources
    │   │   │   │   ├── LoginRemoteDatasource.swift (protocol)
    │   │   │   │   ├── LoginFirebaseDatasource.swift (protocol)
    │   │   │   │
    │   │   │   ├── LoginRepositories   
    │   │   │   │   ├── LoginRemoteReposioty.swift  (protocol)
    │   │   │   │
    │   │   │   ├── UseCases
    │   │   │       ├── LoginRemoteUseCase     (protocol)
    │   │   │       ├── LoginRemoteUseCaseImpl (implementation)
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

---

## **Entities**

### **Codable e Protocolos Genéricos com `associatedtype`**

No Swift, `Codable` não funciona diretamente em protocolos que envolvem `any` ou tipos existenciais, pois o compilador não consegue inferir como serializar essas propriedades.

Para manter a **independência da camada de domínio** e garantir suporte a múltiplas fontes de dados (ex: Firebase, REST, Local), adotamos uma abordagem baseada em protocolos com `associatedtype`, respeitando os princípios da Clean Architecture:

### 🔹 Por que usar essa abordagem?

- ✅ Para manter a **camada de domínio livre de tipos concretos**
- ✅ Para permitir **múltiplas implementações intercambiáveis** (ex: Firebase, REST, Local)
- ✅ Para facilitar testes com **mocks e stubs**
- ✅ Para evitar que `Codable`, `Foundation` e outras dependências vazem para o domínio

---

### **Exemplo de protocolo de entidade com `associatedtype`**

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

### **Implementação concreta e segura com Codable**

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
O Codable é aplicado somente nos modelos concretos, permitindo serialização sem comprometer o domínio.

### **Métodos de Serialização e Desserialização Segura**

```swift
static func fromJson(_ jsonData: Data) -> Result<UserModel, Error> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601

    do {
        let decoded = try decoder.decode(UserModel.self, from: jsonData)
        return .success(decoded)
    } catch {
        return .failure(error)
    }
}

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

### **Versão com Result para tratamento de erro**

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

Esta abordagem proporciona:

✅ Alta testabilidade (mock via protocolo)

✅ Baixo acoplamento com Codable e Foundation

✅ Suporte a múltiplas fontes de dados

✅ Facilidade para aplicar princípios de Clean Architecture

⚠️ Cuidado apenas com o uso de associatedtype, pois ele impede o uso direto de tipos existenciais (como let x: UserEntity).

Use essa arquitetura quando quiser isolar o domínio, trabalhar com mocks, múltiplas implementações ou garantir evolução futura da app com mínima fricção.


