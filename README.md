# 🛒 SnapShot — Multi-Role E-Commerce Infrastructure

<!-- TECH BADGES -->
<p align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/REST%20APIs-Dio%20%2F%20Http-orange?style=for-the-badge" alt="REST APIs" />
    <img src="https://img.shields.io/badge/DevOps-Flavors--2--Roles-blueviolet?style=for-the-badge" alt="Flavors" />
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase" />
  <img src="https://img.shields.io/badge/BLoC%20%2F%20Cubit-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="BLoC" />
  <img src="https://img.shields.io/badge/Architecture-Clean-brightgreen?style=for-the-badge" alt="Clean Architecture" />
</p>

> 🚀 Elite multi-flavor e-commerce app built on **Clean Architecture**. Supports a streamlined **User-to-Owner** lifecycle.

---

### 🏗️ 📐 Presentation & Reusable Widgets

* **🧩 Reusable Widgets:** Generic wrappers (Buttons, Fields, Cards) to enforce the **DRY principle** and zero UI duplication.
* **⚡ 60fps Performance:** Optimized widget trees with `const` constructors for smooth, lag-free scrolling.
* **🎭 Multi-Flavor Hierarchy (User ➔ Owner):** Native Gradle/Xcode flavors to isolate views and permissions within a single codebase.

---

### ⚡ 🔮 Core Project Functions

#### 1️⃣ 👤 USER: Local-First Cart & Wishlist Logic (`manageCartAndFavorites`)
* **🧠 Logic:** Instant UI feedback for cart mutations and product liking without network overhead.
* **⚙️ Steps:** Intercepts toggles inside specialized **Hive Boxes** ➔ Updates cart totals and bookmark states in-memory instantly ➔ Emits Cubit state updates ➔ Syncs with backend asynchronously.

#### 2️⃣ 👤 USER: Offline-First Caching (`fetchPaginatedProducts`)
* **🧠 Logic:** Instant loading via local storage.
* **⚙️ Steps:** Reads from **Hive DB** immediately ➔ Syncs with remote data in background.

#### 3️⃣ 👤 USER: Zero-Leak Pagination
* **🧠 Logic:** Cuts payload overhead by **35%**; prevents memory spikes.
* **⚙️ Steps:** Tracks list via repository cursor ➔ Fetches fixed blocks from **Firestore/REST API** ➔ Appends rows lazily.

#### 4️⃣ 💳 USER: Stripe Payment Pipeline (`executeStripePayment`)
* **🧠 Logic:** Secure transaction flow.
* **⚙️ Steps:** Requests Ephemeral Key via **REST API** ➔ Caches tokens ➔ Triggers native **Stripe Sheet** via Cubit.

---

#### 5️⃣ 👑 OWNER: Management & Approval Engine (`manageOrders`)
* **🧠 Logic:** Executive control panel for revenue and order lifecycle.
* **⚙️ Steps:** Streams active store orders ➔ Reviews revenue metrics ➔ Triggers status approvals to complete order flow.

---

#### 6️⃣ 💼 BACKEND: Hybrid Data Layer
* **🧠 Logic:** Orchestrates complex data from multiple sources.
* **⚙️ Steps:** Combines **REST APIs** (static data) and **Firestore Streams** (live updates) under abstract contracts.

---

### 🛠️ 💻 Tech Stack

* **📱 Framework:** Flutter (iOS & Android)
* **📐 Architecture:** Feature-Driven Clean Architecture & SOLID
* **⚙️ DevOps:** Native Product Flavors (User, Owner)
* **🔄 State Management:** Flutter BloC / Cubit
* **🌐 Network:** REST APIs (Dio) & Firebase Cloud Firestore
* **💾 Persistence:** Hive Local Binary DB & Secure Storage
* **💳 Payments:** Stripe Native SDK
