# High level Architecture
``` 
Presentation (UI)
    ↓
Application (State - Riverpod)
    ↓
Domain (Business logic)
    ↓
Data (Drift DB, services)
```
# Folder structure
```
lib/
│
├── core/                     # Shared across app
│   ├── database/
│   │   ├── app_database.dart
│   │   ├── tables/
│   │   └── daos/
│   │
│   ├── services/
│   │   ├── printer/
│   │   │   ├── printer_service.dart
│   │   │   └── bluetooth_printer_service.dart
│   │   │
│   │   ├── scanner/
│   │   │   └── barcode_listener.dart
│   │   │
│   │   ├── qr/
│   │   │   └── qr_generator_service.dart
│   │   │
│   │   └── banner/
│   │       └── banner_generator_service.dart
│   │
│   ├── errors/
│   │   ├── exceptions.dart
│   │   ├── failures.dart
│   │   └── error_handler.dart
│   │
│   ├── utils/
│   │   ├── logger.dart
│   │   ├── constants.dart
│   │   └── extensions.dart
│   │
│   └── providers/
│       └── core_providers.dart
│
├── features/
│
│   ├── product/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── datasources/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   │
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   ├── widgets/
│   │   │   └── providers/
│   │   │
│   │   └── product_module.dart
│
│   ├── cart/
│   │   ├── application/
│   │   │   ├── cart_notifier.dart
│   │   │   └── cart_state.dart
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── billing/
│   │   ├── application/
│   │   │   ├── billing_service.dart
│   │   │   └── billing_provider.dart
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── dashboard/
│   │   ├── presentation/
│   │   └── providers/
│
│   └── settings/
│
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
│
└── main.dart

```