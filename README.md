<p align="center">
  <img src="assets/icon/app_icon.png" width="110" alt="Shoply app icon">
</p>

<h1 align="center">Shoply</h1>

<p align="center">
  A Flutter shopping app with Firebase: browse categories and products, save favorites,
  manage a cart, place orders and follow them — in light or dark mode.
</p>

---

## Screenshots

### Welcome & sign in

| | Splash | Login | Sign Up | Forgot Password |
|:-:|:-:|:-:|:-:|:-:|
| **Light** | <img src="assets/screenshots/splash_light.png" width="200"> | <img src="assets/screenshots/login_light.png" width="200"> | <img src="assets/screenshots/signup_light.png" width="200"> | <img src="assets/screenshots/forgot_password_light.png" width="200"> |
| **Dark** | <img src="assets/screenshots/splash_dark.png" width="200"> | <img src="assets/screenshots/login_dark.png" width="200"> | <img src="assets/screenshots/signup_dark.png" width="200"> | <img src="assets/screenshots/forgot_password_dark.png" width="200"> |

### Shopping

| | Home | Categories | Products | Product Details |
|:-:|:-:|:-:|:-:|:-:|
| **Light** | <img src="assets/screenshots/home_light.png" width="200"> | <img src="assets/screenshots/categories_light.png" width="200"> | <img src="assets/screenshots/products_light.png" width="200"> | <img src="assets/screenshots/product_details_light.png" width="200"> |
| **Dark** | <img src="assets/screenshots/home_dark.png" width="200"> | <img src="assets/screenshots/categories_dark.png" width="200"> | <img src="assets/screenshots/products_dark.png" width="200"> | <img src="assets/screenshots/product_details_dark.png" width="200"> |

### Favorites, cart & orders

| | Favorites | Cart | My Orders | Settings |
|:-:|:-:|:-:|:-:|:-:|
| **Light** | <img src="assets/screenshots/favorites_light.png" width="200"> | <img src="assets/screenshots/cart_light.png" width="200"> | <img src="assets/screenshots/my_orders_light.png" width="200"> | <img src="assets/screenshots/settings_light.png" width="200"> |
| **Dark** | <img src="assets/screenshots/favorites_dark.png" width="200"> | <img src="assets/screenshots/cart_dark.png" width="200"> | <img src="assets/screenshots/my_orders_dark.png" width="200"> | <img src="assets/screenshots/settings_dark.png" width="200"> |

### Notifications & support

| | Notifications | Contact Us |
|:-:|:-:|:-:|
| **Light** | <img src="assets/screenshots/notifications_light.png" width="200"> | <img src="assets/screenshots/contact_us_light.png" width="200"> |
| **Dark** | <img src="assets/screenshots/notifications_dark.png" width="200"> | <img src="assets/screenshots/contact_us_dark.png" width="200"> |

### Legal

| Terms & Conditions | Privacy Policy |
|:-:|:-:|
| <img src="assets/screenshots/terms_conditions_light.png" width="200"> | <img src="assets/screenshots/privacy_policy_dark.png" width="200"> |

## Features

- **Account** — sign up with a profile photo, email verification, login, forgot password (reset link by email), change password, update profile, logout.
- **Home** — a banner slider with one slide per category (tap a slide to open that category), category list and trending products.
- **Categories & products** — every category from Firestore, its products in a grid, and a details page with rating, description and quantity picker.
- **Favorites** — tap the heart on any product; the list is saved per user in Firestore.
- **Cart** — change quantities, remove items, see the total, and check out to create an order.
- **My Orders** — every order with its status (Pending, Approved, Delivered), filtered by All / Active / Completed, with an item breakdown.
- **Notifications** — the bell on Home lists a notification for every order placed; new ones are marked with a dot.
- **Badges** — the Favorite and Cart tabs show how many items each one holds.
- **Dark mode** — switch in Settings; follows the phone setting until you choose.
- **Content screens** — About, Contact Us (messages are saved to Firestore; tap the support email to copy it), Privacy Policy and Terms & Conditions, all loaded from Firestore.
- **Responsive** — sizes scale with `flutter_screenutil`; checked on screens from iPhone SE to iPad.

## Tech stack

| Area | Packages |
|---|---|
| State management | `flutter_bloc` (Cubit) |
| Backend | `firebase_auth`, `cloud_firestore` |
| Models | `freezed`, `json_serializable` |
| Errors | `dartz` (`Either<String, T>` from every repository) |
| UI | `flutter_screenutil`, `cached_network_image`, `smooth_page_indicator`, `pro_dialog` |
| Device | `image_picker`, `shared_preferences`, `flutter_secure_storage` |

## Project structure

Each feature follows clean architecture:

```
lib/
├── core/            # routes, theme (light + dark palette), shared widgets, helpers, seeder
├── data/            # shared entities, models and services (user, product, cart)
└── features/
    └── <feature>/
        ├── data/          # datasource (Firebase calls), models, repository implementation
        ├── domain/        # entities, repository contract, use cases
        └── presentation/  # bloc (cubit + state), screen, widgets
```

Features: `auth` (login, signup, forgot password), `home`, `category`, `products`, `product_details`,
`favorite`, `cart`, `my_orders`, `notifications`, `drawer`, `settings`, `update_profile`, `change_password`, `about`,
`contact_us`, `legal`, `theme`, `main_shell` (bottom navigation).

## Firestore data

| Collection | What it holds |
|---|---|
| `users/{uid}` | profile (name, username, email, address, photo) |
| `users/{uid}/favorites/{productId}` | the user's favorite products |
| `users/{uid}/cart/{productId}` | cart items with quantity |
| `users/{uid}/notifications` | notifications (one per order placed) |
| `categories`, `products` | the catalog |
| `orders` | placed orders with status |
| `contact_messages` | messages sent from Contact Us |
| `app_content` | About, contact info, Privacy Policy, Terms & Conditions |

Profile photos are shrunk to 400 px and saved inside the user document, so the app runs on
Firebase's free Spark plan without Cloud Storage.

## Getting started

1. Install Flutter (built with Flutter 3.47, Dart 3.13).
2. Clone the repo and get packages:
   ```bash
   git clone https://github.com/bayanqat/bayan_final_project_shoply.git
   cd bayan_final_project_shoply
   flutter pub get
   ```
3. Connect your own Firebase project (Authentication with Email/Password, and Cloud Firestore):
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
4. Run the app:
   ```bash
   flutter run
   ```
   On first launch `FirestoreSeeder.seed()` in `lib/main.dart` fills Firestore with sample
   categories, products and app content. Remove that line once the data is there.
