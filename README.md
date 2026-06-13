# 🛒 SnapShot — Multi-Role E-Commerce Infrastructure

<!-- TECH BADGES -->
<p align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/REST%20APIs-Dio%20%2F%20Http-orange?style=for-the-badge" alt="REST APIs" />
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase" />
  <img src="https://img.shields.io/badge/BLoC%20%2F%20Cubit-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="BLoC" />
  <img src="https://img.shields.io/badge/Architecture-Clean-brightgreen?style=for-the-badge" alt="Clean Architecture" />
</p>

> 🚀 Elite multi-flavor e-commerce app built on **Clean Architecture** and **SOLID principles**. Supports full product lifecycle across 3 distinct native roles.

---

### 🏗️ 📐 Presentation & Reusable Widgets

* **🧩 Reusable Widgets:** Built generic, fully custom wrappers (Buttons, Fields, Cards, Shimmers) to enforce the **DRY principle** and zero UI duplication.
* **⚡ 60fps Performance:** Optimized widget trees with strict use of `const` constructors to eliminate redundant rendering.
* **🎭 Multi-Flavor Hierarchy (User ➔ Owner ➔ Delivery):** Native Gradle/Xcode flavors configured to completely split views and actions based on the active role within a single codebase.

---

### ⚡ 🔮 Core Project Functions & Multi-Role Flow

#### 1️⃣ 👤 USER: Offline-First Caching (`fetchPaginatedProducts`)
* **🧠 Logic:** Prevents lag by loading local cached data instantly.
* **⚙️ Steps:** Reads from **Hive DB** immediately for zero UI lag ➔ Syncs with remote database in the background.

#### 2️⃣ 👤 USER: Zero-Leak Pagination
* **🧠 Logic:** Cuts network payload overhead by **35%** and prevents memory spikes.
* **⚙️ Steps:** Tracks lists via a repository cursor ➔ Fetches fixed blocks (`N` records) from **Firestore/REST API** ➔ Appends rows without full view rebuilds.

#### 3️⃣ 💳 USER: Stripe Payment Pipeline (`executeStripePayment`)
* **🧠 Logic:** Secure transactions across all application product flavors.
* **⚙️ Steps:** Requests Ephemeral Key via **REST API** ➔ Caches tokens locally ➔ Triggers native **Stripe Sheet** via Cubit states.

---

#### 4️⃣ 👑 OWNER: Live Management & Serve Engine (`manageAndServeOrders`)
* **🧠 Logic:** Executive control panel for the store owner to process revenue and dispatch orders.
* **⚙️ Steps:** Streams active store orders ➔ Owner reviews live revenue metrics ➔ Owner triggers approval to **Serve/Assign** the order, routing it instantly to the **Delivery flavor** queue.

---

#### 5️⃣ 💼 BACKEND: Hybrid Data Layer
* **🧠 Logic:** Orchestrates complex data from multiple sources without architectural leaks.
* **⚙️ Steps:** Combines **REST APIs** (for static data and Stripe tokens) and **Firestore Streams** (for live order status updates).

---

### 🛠️ 💻 Tech Stack

* **📱 Framework:** Flutter (iOS & Android)
* **📐 Architecture:** Feature-Driven Clean Architecture & SOLID
* **⚙️ DevOps:** Native Product Flavors (User, Owner, Delivery)
* **🔄 State Management:** Flutter BloC / Cubit
* **🌐 Network:** REST APIs (Dio) & Firebase Cloud Firestore
* **💾 Persistence:** Hive Local Binary DB & Secure Storage
* **💳 Payments:** Stripe Native SDK
