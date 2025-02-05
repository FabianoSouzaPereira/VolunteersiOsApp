## Diferenças e Ajustes para Swift

O Swift usa DAO geralmente via CoreData, então a camada Persistence foi nomeada para refletir isso.
Use Cases são comuns em arquiteturas limpas no Swift.
Repositories seguem a mesma lógica, separando interfaces do domínio e implementações na camada de dados.
A camada de UI foi separada por Screens e Components, o que ajuda na reutilização de elementos visuais no SwiftUI.
A injeção de dependências pode ser feita com SwiftDependencyInjection frameworks ou manualmente usando @StateObject e @EnvironmentObject.

``` 
App
│── DI
│   ├── AppModule.swift       // Módulos globais da DI para a aplicação inteira (ex.: CoreData, Alamofire, etc.)
│   ├── NetworkModule.swift   // Configuração de rede e repositórios globais
│
├── Core
│   ├── DI
│   │   ├── CoreModule.swift  // Módulo de DI de Core (ex.: UserDefaults, serviços globais)
│   ├── Extensions            // Extensões auxiliares para reutilização de código
│   ├── Utils                 // Utilitários e helpers globais
│
├── Data
│   ├── API
│   │   ├── UserService.swift      // Comunicação com a API para usuários
│   │   ├── LoginService.swift     // Comunicação com a API para login
│   │   ├── ProfileService.swift   // Comunicação com a API para perfis
│   │
│   ├── Persistence
│   │   ├── UserStorage.swift      // Persistência de dados de usuários (CoreData, FileManager, UserDefaults)
│   │   ├── LoginStorage.swift     // Persistência de dados de login
│   │   ├── ProfileStorage.swift   // Persistência de perfis
│   │
│   ├── DI
│   │   ├── DataModule.swift       // DI de dependências de Data (ex.: Repositórios, DataSources)
│   │
│   ├── Models
│   │   ├── User.swift             // Modelo de dados (POJOs, DTOs)
│   │   ├── Login.swift
│   │   ├── Profile.swift
│   │
│   ├── Repositories
│   │   ├── UserRepositoryImpl.swift   // Implementação da interface definida no domínio
│   │   ├── LoginRepositoryImpl.swift
│   │   ├── ProfileRepositoryImpl.swift
│   │
│   ├── DataSources
│       ├── Remote
│       │   ├── UserRemoteDataSource.swift
│       │   ├── LoginRemoteDataSource.swift
│       │   ├── ProfileRemoteDataSource.swift
│       │
│       ├── Local
│       │   ├── UserLocalDataSource.swift
│       │   ├── LoginLocalDataSource.swift
│       │   ├── ProfileLocalDataSource.swift
│
├── Domain
│   ├── DI
│   │   ├── DomainModule.swift // DI de dependências do domínio (UseCases, Repositórios)
│   │
│   ├── Entities
│   │   ├── UserEntity.swift
│   │   ├── LoginEntity.swift
│   │   ├── ProfileEntity.swift
│   │
│   ├── Repositories
│   │   ├── UserRepository.swift   // Interfaces de repositórios
│   │   ├── LoginRepository.swift
│   │   ├── ProfileRepository.swift
│   │
│   ├── UseCases
│       ├── GetUserUseCase.swift
│       ├── LoginUseCase.swift
│       ├── GetProfileUseCase.swift
│
├── Presentation
│   ├── DI
│   │   ├── PresentationModule.swift // DI de dependências da camada de UI (ViewModels, Providers)
│   │
│   ├── Screens
│   │   ├── Home
│   │   │   ├── HomeView.swift
│   │   │   ├── HomeViewModel.swift
│   │   │   ├── HomeState.swift
│   │   │
│   │   ├── Login
│   │   │   ├── LoginView.swift
│   │   │   ├── LoginViewModel.swift
│   │   │   ├── LoginState.swift
│   │   │
│   │   ├── Settings
│   │       ├── SettingsView.swift
│   │       ├── SettingsViewModel.swift
│   │       ├── SettingsState.swift
│   │
│   ├── ViewModels
│   │   ├── HomeViewModel.swift
│   │   ├── LoginViewModel.swift
│   │   ├── SettingsViewModel.swift
│   │
│   ├── Components   // Componentes reutilizáveis de UI (ex: botões, inputs)
│   ├── Themes       // Definição de temas e estilos globais
│   ├── Navigation   // Gerenciamento de navegação entre telas
│
├── AppDelegate.swift    // Classe principal da aplicação (UIApplicationDelegate)
├── SceneDelegate.swift  // Gerencia a configuração da cena principal (caso use UIKit)
├── Main.swift           // Entry point da aplicação (caso use SwiftUI)

```
