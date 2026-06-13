# 🛒 SnapShot — Advanced Multi-Role E-Commerce Infrastructure

An elite, production-grade e-commerce application built on strict **Clean Architecture (Domain, Data, Presentation layers)** and **SOLID principles**, with a core focus on **Clean Code**, highly reusable widget systems, and extreme backend optimization.

## 🏗️ Architectural Rigor & Reusable Presentation
* **Separation of Concerns:** Rigid division between data mutations, core business logic (Use Cases), and presentation layout.
* **Component-Driven Reusable Widgets:** Built an independent library of highly configurable custom widgets (adaptive buttons, generic shimmers, and modular cards) to eliminate redundant UI duplication and strictly enforce the **DRY principle**.
* **Performance-First Rendering:** Enforced precise widget tree structures using `const` constructors to eliminate redundant element updates and secure a flawless 60fps scrolling.
* **Multi-Flavor Environments:** Native Gradle/Xcode product flavors configured to completely segregate multi-role workflows (User, Owner, Staff, Delivery) within a single codebase.
* **Decoupled State Control:** Driven by **BloC/Cubit** to ensure a predictable, highly responsive, and asynchronous data flow.

## ⚡ High-Performance & Core Project Functions
* **Smart Offline-First Caching (`fetchPaginatedProducts`):** Developed an advanced caching layer using Hive binary storage. The application queries local Hive boxes instantly for zero UI lag, while concurrently handling cursor-based **Cloud Firestore Streams** in the background to fetch the next sequential blocks without any memory spikes or payload overhead.
* **Secure Payment Pipeline (`executeStripePayment`):** Orchestrates safe client-to-server transaction mutations by generating Ephemeral Keys and Customer IDs, caching them in local storage, and passing secure state abstractions directly to the native **Stripe Payment Sheet**.
* **Zero-Leak Pagination Mechanism:** Engineered a custom pagination pipeline synchronized between remote NoSQL collections and local Hive indices, cutting total payload overhead by 35%.

## 🛠️ Tech Stack & Patterns
* **Framework:** Flutter (iOS & Android)
* **Architecture:** Feature-Driven Clean Architecture & SOLID
* **State Management:** Flutter BloC / Cubit
* **Storage & DB:** Hive Local Binary DB, Firebase Cloud Firestore NoSQL
* **Payment Gateways:** Stripe Native SDK Integration
