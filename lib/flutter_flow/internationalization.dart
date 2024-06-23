import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'nv3hp7h9': {
      'en': 'Sign Up',
      'th': '',
    },
    '2lurcllg': {
      'en': 'Email...',
      'th': '',
    },
    '1j49a7uz': {
      'en': 'Password...',
      'th': '',
    },
    'vrozafse': {
      'en': 'Confirm Password...',
      'th': '',
    },
    '8ksh6rel': {
      'en': 'Field is required',
      'th': '',
    },
    'bpp0nrei': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'z1d5nf8y': {
      'en': 'Field is required',
      'th': '',
    },
    'dmd8pg8s': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'jb2qn6yd': {
      'en': 'Field is required',
      'th': '',
    },
    'dcfo7vft': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'sdkzpjr4': {
      'en': 'Login',
      'th': '',
    },
    'a90zq38r': {
      'en': 'Email...',
      'th': '',
    },
    'nt1i51ob': {
      'en': 'Password...',
      'th': '',
    },
    'mnkwu7uq': {
      'en': 'Field is required',
      'th': '',
    },
    'chy4w8dq': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '0abulg4s': {
      'en': 'Field is required',
      'th': '',
    },
    'mbfgmsnd': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'jo00fvtk': {
      'en': 'Log in',
      'th': '',
    },
    'idqlo9qc': {
      'en': 'Sign up',
      'th': '',
    },
    '1brbgdis': {
      'en': 'Home',
      'th': '',
    },
  },
  // task
  {
    'hwtv39jd': {
      'en': 'Tasks',
      'th': '',
    },
    'kuf8gqbp': {
      'en': 'Home',
      'th': '',
    },
  },
  // onboarding
  {
    'sb01g6m4': {
      'en': 'Profile',
      'th': '',
    },
    'ug9vos7z': {
      'en': 'Name...',
      'th': '',
    },
    '8eratmho': {
      'en': 'Set Birthday',
      'th': '',
    },
    'qv279f62': {
      'en': 'Complete Profile',
      'th': '',
    },
    'mqbqtfui': {
      'en': 'Home',
      'th': '',
    },
  },
  // completed
  {
    'evptrh1k': {
      'en': 'Completed',
      'th': '',
    },
    'h1pzn5re': {
      'en': 'Home',
      'th': '',
    },
  },
  // details
  {
    '274xyl21': {
      'en': 'Task Details',
      'th': '',
    },
    '9o3254us': {
      'en': 'Title',
      'th': '',
    },
    '17b622s3': {
      'en': 'Details',
      'th': '',
    },
    'tteevrcr': {
      'en': 'Update Task',
      'th': '',
    },
    'yz8jhtl5': {
      'en': 'Home',
      'th': '',
    },
  },
  // addTask
  {
    'sk8xi17i': {
      'en': 'Add Task',
      'th': '',
    },
    'xrnsa5ty': {
      'en': 'Title...',
      'th': '',
    },
    'zk7mao1n': {
      'en': 'Details...',
      'th': '',
    },
    'gumnd2hx': {
      'en': 'Add Tasks',
      'th': '',
    },
  },
  // Miscellaneous
  {
    'imzsjken': {
      'en': 'Button',
      'th': '',
    },
    'ernlbapg': {
      'en': 'Email...',
      'th': '',
    },
    'f6iybzbs': {
      'en': '',
      'th': '',
    },
    'm4vgp9vm': {
      'en': '',
      'th': '',
    },
    'mrw36kdz': {
      'en': '',
      'th': '',
    },
    'a1px1ybr': {
      'en': '',
      'th': '',
    },
    'u3j2c7b4': {
      'en': '',
      'th': '',
    },
    'rjd7k8x4': {
      'en': '',
      'th': '',
    },
    'lmbfex1p': {
      'en': '',
      'th': '',
    },
    'q15sxxwe': {
      'en': '',
      'th': '',
    },
    'z08onydh': {
      'en': '',
      'th': '',
    },
    '74406ujn': {
      'en': '',
      'th': '',
    },
    '10wxaijm': {
      'en': '',
      'th': '',
    },
    '9ia4hj7k': {
      'en': '',
      'th': '',
    },
    'vd89isvv': {
      'en': '',
      'th': '',
    },
    'b0acfl9z': {
      'en': '',
      'th': '',
    },
    'l20ccws1': {
      'en': '',
      'th': '',
    },
    '0800v4q3': {
      'en': '',
      'th': '',
    },
    'kpriipm5': {
      'en': '',
      'th': '',
    },
    'wjrzjkc5': {
      'en': '',
      'th': '',
    },
    '20kyww44': {
      'en': '',
      'th': '',
    },
    'iq7m53t9': {
      'en': '',
      'th': '',
    },
    'hcvqrkut': {
      'en': '',
      'th': '',
    },
    'whkeliam': {
      'en': '',
      'th': '',
    },
    'a9kfyf3e': {
      'en': '',
      'th': '',
    },
    'zcq6c3g6': {
      'en': '',
      'th': '',
    },
    'icweas4h': {
      'en': '',
      'th': '',
    },
    'ngngvqbt': {
      'en': '',
      'th': '',
    },
    'bzck0wpv': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
