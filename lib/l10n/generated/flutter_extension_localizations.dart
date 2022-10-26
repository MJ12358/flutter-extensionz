import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'flutter_extension_localizations_en.dart';
import 'flutter_extension_localizations_es.dart';
import 'flutter_extension_localizations_fr.dart';
import 'flutter_extension_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of FlutterExtensionLocalizations
/// returned by `FlutterExtensionLocalizations.of(context)`.
///
/// Applications need to include `FlutterExtensionLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/flutter_extension_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FlutterExtensionLocalizations.localizationsDelegates,
///   supportedLocales: FlutterExtensionLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FlutterExtensionLocalizations.supportedLocales
/// property.
abstract class FlutterExtensionLocalizations {
  FlutterExtensionLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FlutterExtensionLocalizations? of(BuildContext context) {
    return Localizations.of<FlutterExtensionLocalizations>(context, FlutterExtensionLocalizations);
  }

  static const LocalizationsDelegate<FlutterExtensionLocalizations> delegate = _FlutterExtensionLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ru')
  ];

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;
}

class _FlutterExtensionLocalizationsDelegate extends LocalizationsDelegate<FlutterExtensionLocalizations> {
  const _FlutterExtensionLocalizationsDelegate();

  @override
  Future<FlutterExtensionLocalizations> load(Locale locale) {
    return SynchronousFuture<FlutterExtensionLocalizations>(lookupFlutterExtensionLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_FlutterExtensionLocalizationsDelegate old) => false;
}

FlutterExtensionLocalizations lookupFlutterExtensionLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return FlutterExtensionLocalizationsEn();
    case 'es': return FlutterExtensionLocalizationsEs();
    case 'fr': return FlutterExtensionLocalizationsFr();
    case 'ru': return FlutterExtensionLocalizationsRu();
  }

  throw FlutterError(
    'FlutterExtensionLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
