import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/presentation/pages/add_item/add_item.dart';
import 'package:daily_scavenger/presentation/pages/home/my_items_page.dart';
import 'package:daily_scavenger/presentation/pages/item_page/item_detail.dart';

import 'package:flutter/material.dart';



class AppRouter {
  static const String aboutRoute = '/about';
  static const String accountRoute = '/account';
  static const String categoryProductsRoute = '/category-products';
  static const String cartRoute = '/cart';
  static const String myItemsPageRoute = '/myItemsPage';
  static const String favoritesRoute = '/favorite';
  static const String addPlaceRoute = '/addPlaceRoute';
  static const String forgotPasswordRoute = '/forgot-password';
  static const String helpRoute = '/help';
  static const String homeRoute = '/home';
  static const String myDetailsRoute = '/my-details';
  static const String notificationsRoute = '/notifications';
  static const String onboardingRoute = '/onboarding';
  static const String orderSuccessRoute = '/order-success';
  static const String ordersRoute = '/orders';
  static const String paymentMethodsRoute = '/payment-methods';
  static const String productDetailsRoute = '/product-details';
  static const String promoCodesRoute = '/promo-codes';
  static const String registerPhoneRoute = '/register-phone';
  static const String searchRoute = '/search';
  static const String selectLocationRoute = '/select-location';
  static const String setLocationMapRoute = '/set-location-map';
  static const String storesRoute = '/stores';
  static const String storeDetailsRoute = '/store-details';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String splashRoute = '/splash';
  static const String verificationRoute = '/verification';
  static const String addItemRoute = '/addItem';
  static const String itemDetailRoute = '/itemDetail'; 


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case aboutRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const ItemFormPage(),
      //   );
      case addItemRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AddItemPage(),
        );
      // case categoryProductsRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) =>
      //         CategoryProductsPage(category: settings.arguments as Category),
      //   );
      // case itemDetailRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const ItemDetailPage(itemId: null,),
      //   );
       case itemDetailRoute:
        // Extract the itemId from the route arguments
       
          return MaterialPageRoute(builder: (_) => ItemDetailPage(id: settings.arguments as ItemData,));
        
         // Or handle the case where the itemId is missing
      
      case myItemsPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MyItemsPage(),
        );
      // case addPlaceRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const AddPlacePage(userId: null,),
        // );
      // case forgotPasswordRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const ForgotPasswordPage(),
      //   );
      // case helpRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const HelpPage(),
      //   );
      // case homeRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const HomePage(),
      //   );
      // case myDetailsRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const MyDetailsPage(),
      //   );
      // case notificationsRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const NotificationsPage(),
      //   );
      // case onboardingRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const OnboardingPage(),
      //   );
      // case orderSuccessRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const OrderSuccessPage(),
      //   );
      // case ordersRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const OrdersPage(),
      //   );
      // case paymentMethodsRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const PaymentMethodsPage(),
      //   );
      // case productDetailsRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => ProductDetailsPage(
      //       product: settings.arguments as Product,
      //     ),
      //   );
      // case promoCodesRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const PromoCodesPage(),
      //   );
      // case registerPhoneRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const RegisterPhonePage(),
      //   );
      // case searchRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => SearchPage(
      //       query: settings.arguments as String,
      //     ),
      //   );
      // case selectLocationRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const SelectLocationPage(),
      //   );
      // case setLocationMapRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const SetLocationMapPage(),
      //   );
      // case storesRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const StoresPage(),
      //   );
      // case storeDetailsRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => StoreDetailsPage(
      //       store: settings.arguments as Store,
      //     ),
      //   );
      // case loginRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const LoginPage(),
      //   );
      // case registerRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const RegisterPage(),
      //   );
      // case splashRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const SplashPage(),
      //   );
      // case verificationRoute:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => VerificationPage(
      //       verificationId: settings.arguments as String,
      //     ),
        // );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
