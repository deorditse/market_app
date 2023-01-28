import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:models/models.dart';
import 'packages/ui_layout/pages/auth_page/auth_page.dart';
import 'packages/ui_layout/pages/home_page/home_page.dart';
import 'packages/ui_layout/pages/home_page/pages/about_task_page/about_task_page.dart';
import 'packages/ui_layout/pages/home_page/pages/about_task_page/pages/orders_to_fulfill_page/orders_to_fulfill_page.dart';
import 'package:business_layout/business_layout.dart';
import 'packages/ui_layout/pages/home_page/pages/about_task_page/pages/orders_to_fulfill_page/pages/qr_code_scanner_page.dart';
import 'packages/ui_layout/style_app/theme_app/material_theme/light_custom_theme_material.dart';

Future<void> main() async {
  //для экрана заставки
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDateFormatting();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MarketplaceApp());
}

//flutter create --template=package

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      lazy: false,
      create: (_) => AuthBloc()..add(InitialAuthEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeLight,
        initialRoute: MainPage.id,
        routes: {
          MainPage.id: (_) => MainPage(),
          AuthPage.id: (_) => AuthPage(),
          //роуты для главной страницы
          HomePage.id: (_) => HomePage(),
          AboutTaskPage.id: (_) => AboutTaskPage(
                title: '',
                location: Location.v1,
              ),

          OrdersToFulfillPage.id: (_) => OrdersToFulfillPage(
                title: "",
                location: Location.v1,
                listWithOrders: const [],
              ),

          QrCodeScannerPage.id: (_) => QrCodeScannerPage(),
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  static const String id = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build MainPage");
    return Material(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state) {
            if (state.isSignIn) {
              return HomePage();
            } else {
              return AuthPage();
            }
          },
        ),
      ),
    );
  }
}


//
// <key>io.flutter.embedded_views_preview</key>
// <true/>
// <key>NSCameraUsageDescription</key>
// <string>Необходим доступ к камере</string>
// <key>NSPhotoLibraryUsageDescription</key>
// <string>Необходимо разрешение к галереи</string>
// <key>CFBundleDevelopmentRegion</key>
// <string>$(DEVELOPMENT_LANGUAGE)</string>
// <key>CFBundleDisplayName</key>
// <string>Market App</string>
// <key>CFBundleExecutable</key>
// <string>$(EXECUTABLE_NAME)</string>
// <key>CFBundleIdentifier</key>
// <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
// <key>CFBundleInfoDictionaryVersion</key>
// <string>6.0</string>
// <key>CFBundleName</key>
// <string>market_app</string>
// <key>CFBundlePackageType</key>
// <string>APPL</string>
// <key>CFBundleShortVersionString</key>
// <string>$(FLUTTER_BUILD_NAME)</string>
// <key>CFBundleSignature</key>
// <string>????</string>
// <key>CFBundleVersion</key>
// <string>$(FLUTTER_BUILD_NUMBER)</string>
// <key>LSRequiresIPhoneOS</key>
// <true/>
// <key>UILaunchStoryboardName</key>
// <string>LaunchScreen</string>
// <key>UIMainStoryboardFile</key>
// <string>Main</string>
// <key>UISupportedInterfaceOrientations</key>
// <array>
// <string>UIInterfaceOrientationPortrait</string>
// <string>UIInterfaceOrientationLandscapeLeft</string>
// <string>UIInterfaceOrientationLandscapeRight</string>
// </array>
// <key>UISupportedInterfaceOrientations~ipad</key>
// <array>
// <string>UIInterfaceOrientationPortrait</string>
// <string>UIInterfaceOrientationPortraitUpsideDown</string>
// <string>UIInterfaceOrientationLandscapeLeft</string>
// <string>UIInterfaceOrientationLandscapeRight</string>
// </array>
// <key>UIViewControllerBasedStatusBarAppearance</key>
// <false/>
// <key>CADisableMinimumFrameDurationOnPhone</key>
// <true/>
// <key>UIApplicationSupportsIndirectInputEvents</key>
// <true/>
// </dict>
// </plist>

