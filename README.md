## Diferenças e Ajustes para Swift

O Swift usa DAO geralmente via CoreData, então a camada Persistence foi nomeada para refletir isso.
Use Cases são comuns em arquiteturas limpas no Swift.
Repositories seguem a mesma lógica, separando interfaces do domínio e implementações na camada de dados.
A camada de UI foi separada por Screens e Components, o que ajuda na reutilização de elementos visuais no SwiftUI.
A injeção de dependências pode ser feita com SwiftDependencyInjection frameworks ou manualmente usando @StateObject e @EnvironmentObject.

``` 
App
│── DI
│   ├── AppModule.swift       // Módulos globais de injeção de dependências
│   ├── NetworkModule.swift   // Configuração de rede e repositórios globais
│
├── Core
│   ├── DI
│   │   ├── CoreModule.swift  // Configurações globais (ex.: UserDefaults, serviços globais)
│   ├── Extensions            // Extensões auxiliares para reutilização de código
│   ├── Utils                 // Utilitários e helpers globais
│
├── Data
│   ├── API
│   ├── Persistence
│   ├── Models
│   ├── Repositories
│   ├── DataSources
│
├── Domain
│   ├── Entities
│   ├── Repositories
│   ├── UseCases
│
├── Presentation
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
│   ├── Components   // Componentes reutilizáveis de UI (botões, inputs, etc.)
│   ├── Themes       // Definição de temas e estilos globais
│   ├── Navigation   // Gerenciamento de navegação entre telas
│
├── VolunteersiOsApp.swift // Entry point do app (substitui AppDelegate)


```
