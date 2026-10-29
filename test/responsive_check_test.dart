import 'package:final_project_shoply/core/utils/theme/app_theme.dart';
import 'package:final_project_shoply/data/entities/cart_item_entity.dart';
import 'package:final_project_shoply/data/entities/product_entity.dart';
import 'package:final_project_shoply/features/app/presentation/bloc/cubit.dart';
import 'package:final_project_shoply/features/auth/forgot_password/presentation/screen/forgot_password_screen.dart';
import 'package:final_project_shoply/features/auth/login/presentation/screen/login_screen.dart';
import 'package:final_project_shoply/features/auth/signup/presentation/screen/signup_screen.dart';
import 'package:final_project_shoply/features/cart/presentation/bloc/cubit.dart';
import 'package:final_project_shoply/features/cart/presentation/widgets/cart_bottom.dart';
import 'package:final_project_shoply/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:final_project_shoply/features/change_password/presentation/screen/change_password_screen.dart';
import 'package:final_project_shoply/features/drawer/presentation/screen/drawer_menu.dart';
import 'package:final_project_shoply/features/favorite/presentation/bloc/cubit.dart';
import 'package:final_project_shoply/features/my_orders/domain/entities/order_entity.dart';
import 'package:final_project_shoply/features/my_orders/presentation/widgets/order_card.dart';
import 'package:final_project_shoply/features/product_details/presentation/screen/product_details_screen.dart';
import 'package:final_project_shoply/features/products/presentation/widgets/products_grid.dart';
import 'package:final_project_shoply/features/settings/presentation/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

const sizes = {
  'iPhone SE (1st)': Size(320, 568),
  'iPhone SE (3rd)': Size(375, 667),
  'iPhone 17': Size(402, 874),
  'Pro Max': Size(440, 956),
  'Small Android': Size(360, 640),
  'iPad': Size(820, 1180),
  'Landscape phone': Size(874, 402),
};

final products = List.generate(
  4,
  (i) => ProductEntity(
    id: 'p$i',
    name: 'Wireless Headphones Pro Max $i',
    price: 110,
    description: 'Over-ear headphones with soft cushions and long battery life. ' * 3,
    rating: 4.8,
    reviewsCount: 143,
  ),
);

Widget app(Widget home) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AppCubit()),
      BlocProvider(create: (_) => FavoriteCubit()),
      BlocProvider(create: (_) => CartCubit()),
    ],
    child: ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: FontSizeResolvers.radius,
      builder: (context, child) =>
          MaterialApp(theme: AppTheme.themeLight, debugShowCheckedModeBanner: false, home: home),
    ),
  );
}

final screens = <String, Widget Function()>{
  'Login': () => const LoginScreen(),
  'Signup': () => const SignupScreen(),
  'Forgot Password': () => const ForgotPasswordScreen(),
  'Change Password': () => const ChangePasswordScreen(),
  'Settings': () => const SettingsScreen(),
  'Products grid': () => Scaffold(body: ProductsGrid(products: products)),
  'Favorites grid': () => Scaffold(body: ProductsGrid(products: products, showAddToCart: true)),
  'Product Details': () => ProductDetailsScreen(product: products.first),
  'Cart': () => Scaffold(
    body: Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (final p in products) CartItemCard(item: CartItemEntity(product: p, quantity: 2)),
            ],
          ),
        ),
        const CartBottom(),
      ],
    ),
  ),
  'Order card': () => Scaffold(
    body: ListView(
      children: [
        OrderCard(
          order: OrderEntity(
            orderNumber: 123456,
            status: 'pending',
            totalPrice: 355,
            itemsCount: 3,
            createdAt: DateTime(2026, 10, 15),
            items: const [OrderItemEntity(name: 'Wireless Headphones Pro Max', price: 110)],
          ),
        ),
      ],
    ),
  ),
  'Drawer': () => const Scaffold(body: DrawerMenu()),
};

void main() {
  setUpAll(() async {
    // Real Quicksand glyphs instead of the wide square test font
    final loader = FontLoader('Quiksand');
    for (final file in ['Light', 'Regular', 'Medium', 'SemiBold', 'Bold']) {
      loader.addFont(rootBundle.load('assets/fonts/Quicksand-$file.ttf'));
    }
    await loader.load();
  });

  for (final textScale in [1.0, 1.3]) {
    for (final size in sizes.entries) {
      for (final screen in screens.entries) {
        testWidgets('${screen.key} | ${size.key} | text x$textScale', (tester) async {
          tester.view.physicalSize = size.value * 3;
          tester.view.devicePixelRatio = 3;
          tester.platformDispatcher.textScaleFactorTestValue = textScale;
          addTearDown(tester.view.reset);
          addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

          final errors = <String>[];
          final oldHandler = FlutterError.onError;
          FlutterError.onError = (details) {
            final text = details.exceptionAsString();
            if (text.contains('overflowed')) {
              errors.add(details.toString().split('\n').where((l) => l.contains('Column') || l.contains('Row') || l.contains('creator') || l.contains('.dart')).take(6).join(' | '));
            } else {
              oldHandler?.call(details);
            }
          };
          await tester.pumpWidget(app(screen.value()));
          await tester.pump(const Duration(milliseconds: 100));
          FlutterError.onError = oldHandler;
          expect(errors, isEmpty, reason: errors.toSet().join('\n'));
        });
      }
    }
  }
}
