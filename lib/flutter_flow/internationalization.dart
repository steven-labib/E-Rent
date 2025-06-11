import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    '958lc09t': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    '46pqt2g6': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    'msyba5tl': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'rhsxkeib': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'vr3q3cd5': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'x7yanrai': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'jq37n3r2': {
      'en': 'Or sign up with',
      'ar': 'أو قم بالتسجيل مع',
    },
    '7sylosac': {
      'en': 'Continue with Google',
      'ar': 'متابعة مع جوجل',
    },
    'bx6mmawy': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
    },
    'dc9x771m': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    'p6mmb7ir': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'cp9bqxb6': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'sj5oc3o1': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'dlkwwtc6': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'igyeti7o': {
      'en': 'Or sign up with',
      'ar': 'أو قم بالتسجيل مع',
    },
    '3f28hi4j': {
      'en': 'Continue with Google',
      'ar': 'متابعة مع جوجل',
    },
    'jxxjuqts': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // home
  {
    '3xbmpy0n': {
      'en': 'Get Away',
      'ar': 'ابتعد',
    },
    'u5jhjj1n': {
      'en': 'Find some wonderful little cabins below.',
      'ar': 'ابحث عن بعض الكبائن الصغيرة الرائعة أدناه.',
    },
    'zr4fbl3x': {
      'en': 'Search for your getaway...',
      'ar': 'ابحث عن ملاذك...',
    },
    '5vtm3w5d': {
      'en': 'Guests:',
      'ar': 'الضيوف:',
    },
    'azugsss2': {
      'en': 'Popular Bookings',
      'ar': 'الحجوزات الشعبية',
    },
    'kgj32wkh': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // profile
  {
    'il08rdab': {
      'en': 'Account',
      'ar': 'حساب',
    },
    'dro2nzsk': {
      'en': 'Payment Options',
      'ar': 'خيارات الدفع',
    },
    'xegn6ou5': {
      'en': 'Filter',
      'ar': 'فلتر',
    },
    'xz9smein': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '3n1gh83d': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'm8cbwqra': {
      'en': 'General',
      'ar': 'عام',
    },
    'ldl41fgw': {
      'en': 'Support',
      'ar': 'يدعم',
    },
    '693q1gn1': {
      'en': 'Terms of Service',
      'ar': 'شروط الخدمة',
    },
    'qg3744ta': {
      'en': 'Invite Friends',
      'ar': 'دعوة الأصدقاء',
    },
    'b5g7dg2a': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'pwf8dzmt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // detail
  {
    '3rphpw0t': {
      'en': 'Hot Tub Access',
      'ar': 'الوصول إلى حوض الاستحمام الساخن',
    },
    'fn9pgxgb': {
      'en': 'No Access',
      'ar': 'لا يوجد وصول',
    },
    'wax4tp01': {
      'en': 'Electronics',
      'ar': 'الإلكترونيات',
    },
    'eg0r0eui': {
      'en': 'Washing Machine',
      'ar': 'غسالة ملابس',
    },
    'kvnhl72b': {
      'en': 'Fridge',
      'ar': 'ثلاجة',
    },
    '135m3imd': {
      'en': 'Gas Stove',
      'ar': 'موقد غاز',
    },
    'npdd67x3': {
      'en': 'TV',
      'ar': 'تلفزيون',
    },
    '9mrl7q13': {
      'en': 'Iron',
      'ar': 'حديد',
    },
    'vaer5uvs': {
      'en': 'Desk',
      'ar': 'مكتب',
    },
    'l58olpw5': {
      'en': 'WiFi',
      'ar': 'واي فاي',
    },
    '8lo0wogf': {
      'en': 'Air Conditioner',
      'ar': 'مكيف الهواء',
    },
    'ci57w2j3': {
      'en': 'Heater',
      'ar': 'سخان',
    },
    '9s3iwn71': {
      'en': 'Location\n',
      'ar': 'موقع',
    },
    'bt2tyc7e': {
      'en': 'specified of Gender :',
      'ar': 'محدد الجنس :',
    },
    'gp1vk5o0': {
      'en': 'Rooms :',
      'ar': 'الغرف :',
    },
    '5e2us5ob': {
      'en': 'Beds :',
      'ar': 'الأسرة :',
    },
    '0ni59yms': {
      'en': 'Baths  :',
      'ar': 'الحمامات :',
    },
    'c5qpfkwr': {
      'en': 'Show All Reviews',
      'ar': 'عرض جميع المراجعات',
    },
    '79ndyhot': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    '3w93a645': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'i020qfjv': {
      'en': 'Base Price',
      'ar': 'السعر الأساسي',
    },
    '4jpf01ik': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'uf67js5c': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
    'habsicv4': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    '58lqtsa4': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // confirmation
  {
    'qg9pbnlx': {
      'en': 'Booking Confirmed!',
      'ar': 'تم تأكيد الحجز!',
    },
    'd9wu1vpy': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'ar':
          'لقد تم تأكيد الدفع الخاص بك، قد يستغرق الأمر من ساعة إلى ساعتين حتى تتم عملية الدفع الخاصة بك وتظهر في قائمة المعاملات الخاصة بك.',
    },
    'orypbdr6': {
      'en': 'Mastercard Ending in 4021',
      'ar': 'بطاقة ماستركارد تنتهي بالرقم 4021',
    },
    'aifspg84': {
      'en': 'Go Home',
      'ar': 'العودة إلى المنزل',
    },
    'qm1jot4c': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Favorites
  {
    'uo7jl7nm': {
      'en': 'Favorites',
      'ar': 'المفضلة',
    },
    'f3oyggws': {
      'en': 'Favorites Listings ',
      'ar': 'قوائم المفضلة',
    },
    'zxr3cqi7': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // booking
  {
    'v4tdn5e4': {
      'en': 'booking',
      'ar': 'الحجز',
    },
    'mzzqnqyl': {
      'en': 'Her are your Bookings',
      'ar': 'هنا حجوزاتك',
    },
    'zs9pqoyu': {
      'en': 'REVIEW',
      'ar': 'مراجعة',
    },
    'ylx03uo7': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'pgspjveq': {
      'en': 'Subtext',
      'ar': 'النص الفرعي',
    },
    'td4ufk2e': {
      'en': '\$11.00',
      'ar': '11.00 دولارًا',
    },
    'wfwg70m4': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // mapview
  {
    'i1ssy630': {
      'en': 'Page Title',
      'ar': 'عنوان الصفحة',
    },
    '9sq7un8g': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // forget_password
  {
    'jnnsbn40': {
      'en': 'Back',
      'ar': 'خلف',
    },
    '61plj427': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    '21354ezz': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar':
          'سنرسل لك رسالة بريد إلكتروني تحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
    },
    'j2int4hv': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
    },
    'fmdt4jnp': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'es0a1g5u': {
      'en': 'Send Link',
      'ar': 'إرسال الرابط',
    },
    'z4dmoz72': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'tltw1zrt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // filter
  {
    'k7bg3lp8': {
      'en': 'Requirements',
      'ar': 'متطلبات',
    },
    '2wo8cvkk': {
      'en': 'fill out the Requirements .....',
      'ar': 'إملأ المتطلبات.....',
    },
    '2xp190n6': {
      'en': 'choice :',
      'ar': 'خيار :',
    },
    '0cxvs1b1': {
      'en': 'Bed',
      'ar': 'سرير',
    },
    'snfsvo6k': {
      'en': 'Room',
      'ar': 'غرفة',
    },
    'iz91wm5w': {
      'en': 'Flat',
      'ar': 'مستوي',
    },
    'z6ltwnnk': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'v4w2va65': {
      'en': 'Electronics :',
      'ar': 'الالكترونيات :',
    },
    '1gb1woal': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'lm0r4gcr': {
      'en': 'Washing Machine',
      'ar': 'غسالة ملابس',
    },
    '0xmyols7': {
      'en': 'Fridge',
      'ar': 'ثلاجة',
    },
    't9tn91wi': {
      'en': 'Gas Stove',
      'ar': 'موقد غاز',
    },
    '62hiy6cn': {
      'en': 'TV',
      'ar': 'تلفزيون',
    },
    'qpjag30h': {
      'en': 'Iron',
      'ar': 'حديد',
    },
    'lsxipe3x': {
      'en': 'Desk',
      'ar': 'مكتب',
    },
    'anvsbovo': {
      'en': 'WiFi',
      'ar': 'واي فاي',
    },
    'p1vn0vw2': {
      'en': 'Air Conditioner',
      'ar': 'مكيف الهواء',
    },
    'ey90r4hc': {
      'en': 'Heater',
      'ar': 'سخان',
    },
    '60w07l2x': {
      'en': 'Tops',
      'ar': 'قمم',
    },
    'nf8qr85e': {
      'en': 'The range of price :',
      'ar': 'نطاق السعر :',
    },
    'vk31a4bz': {
      'en': 'Min Price',
      'ar': 'الحد الأدنى للسعر',
    },
    'b3fhwyju': {
      'en': 'Max Price',
      'ar': 'السعر الأقصى',
    },
    '5jynuhx8': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'kbr6pyid': {
      'en': 'Beds and Rooms :',
      'ar': 'الأسرة والغرف :',
    },
    '5jgkxfuu': {
      'en': 'Rooms ',
      'ar': 'الغرف',
    },
    '9guyvyqh': {
      'en': 'Beds ',
      'ar': 'أسرة',
    },
    '8uuidqlw': {
      'en': 'Baths ',
      'ar': 'الحمامات',
    },
    's9fpigfe': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    '82h8di37': {
      'en': 'Clear Filter',
      'ar': 'مسح الفلتر',
    },
    'q7geq7q7': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // personal_info
  {
    '57oo1f5c': {
      'en': '24',
      'ar': '24',
    },
    'qu5xxl5w': {
      'en': 'Name :',
      'ar': 'اسم :',
    },
    '2u67r8vf': {
      'en': 'Number :',
      'ar': 'رقم :',
    },
    'psoeqng6': {
      'en': 'SSN :',
      'ar': 'رقم الضمان الاجتماعي :',
    },
    'u9goh7cj': {
      'en': 'Email :',
      'ar': 'بريد إلكتروني :',
    },
    'lilq4j9h': {
      'en': 'Password :',
      'ar': 'كلمة المرور :',
    },
    'diy8kgl1': {
      'en': 'College :',
      'ar': 'كلية :',
    },
    '0ta22ihf': {
      'en': 'Cash number:',
      'ar': 'رقم النقد:',
    },
    'f0bb3nqa': {
      'en': 'Bank account :',
      'ar': 'الحساب البنكي :',
    },
    '3xab927x': {
      'en': 'Personal Info',
      'ar': 'المعلومات الشخصية',
    },
    'luh5kulg': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // addPlace
  {
    'mqq5p5a8': {
      'en': 'name',
      'ar': 'اسم',
    },
    '246dss23': {
      'en': 'Description...',
      'ar': 'وصف...',
    },
    'g3zzfwwf': {
      'en': 'Gender...',
      'ar': 'يختار...',
    },
    'i5gbgh40': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'lchh54ss': {
      'en': 'for male ',
      'ar': 'للذكور',
    },
    'r2mlmq5r': {
      'en': 'for female ',
      'ar': 'للاناث',
    },
    '3az8qxev': {
      'en': 'Star Date :',
      'ar': 'تاريخ النجمة :',
    },
    'iiobdg5g': {
      'en': 'select',
      'ar': 'يختار',
    },
    'sp8zexgq': {
      'en': 'End Date :',
      'ar': 'تاريخ النهاية :',
    },
    'khsqt57l': {
      'en': 'select',
      'ar': 'يختار',
    },
    'iap9d2vm': {
      'en': ' Price',
      'ar': 'سعر',
    },
    'is681dcd': {
      'en': 'choice',
      'ar': 'خيار',
    },
    '3grui30x': {
      'en': 'Bed',
      'ar': 'سرير',
    },
    '1leu7iir': {
      'en': 'Room',
      'ar': 'غرفة',
    },
    'x115hf7p': {
      'en': 'Flat',
      'ar': 'مستوي',
    },
    '0yugytm4': {
      'en': 'Bed',
      'ar': 'سرير',
    },
    'lobxanox': {
      'en': 'Electronics',
      'ar': 'الإلكترونيات',
    },
    '2o6zokcu': {
      'en': 'Washing Machine',
      'ar': 'غسالة ملابس',
    },
    'cjigj3kw': {
      'en': 'Fridge',
      'ar': 'ثلاجة',
    },
    '1mtfss06': {
      'en': 'Gas Stove',
      'ar': 'موقد غاز',
    },
    'z6aff3x5': {
      'en': 'TV',
      'ar': 'تلفزيون',
    },
    'hsfxv397': {
      'en': 'Iron',
      'ar': 'حديد',
    },
    'k1m1wcxs': {
      'en': 'Desk',
      'ar': 'مكتب',
    },
    'mvtq8qx7': {
      'en': 'WiFi',
      'ar': 'واي فاي',
    },
    'f3fm2ipa': {
      'en': 'Air Conditioner',
      'ar': 'مكيف الهواء',
    },
    'hn6ehfnk': {
      'en': 'Heater',
      'ar': 'سخان',
    },
    'ju93enxg': {
      'en': 'Beds and Rooms :',
      'ar': 'الأسرة والغرف :',
    },
    '5q8561lh': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'fb2d3d4n': {
      'en': 'Rooms ',
      'ar': 'الغرف',
    },
    '1jvp00dv': {
      'en': 'Beds ',
      'ar': 'أسرة',
    },
    'iirgcmy2': {
      'en': 'Baths ',
      'ar': 'الحمامات',
    },
    '3n3rzp2p': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
    },
    'gir8456i': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    '5keubtod': {
      'en': 'Upload Housing',
      'ar': 'تحميل السكن',
    },
    'gh7plto7': {
      'en': 'Fill out the information below to post a housing',
      'ar': 'قم بملء المعلومات أدناه لنشر السكن',
    },
    'oeix2vne': {
      'en': 'Upload',
      'ar': 'رفع',
    },
  },
  // EditUpload
  {
    'gfz6xzqu': {
      'en': 'Description...',
      'ar': 'وصف...',
    },
    '4nhivk7q': {
      'en': 'Gender',
      'ar': 'جنس',
    },
    'kx87djvk': {
      'en': 'Male',
      'ar': 'ذكر',
    },
    'watj4kbc': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    'nkwr80l2': {
      'en': 'Male',
      'ar': 'ذكر',
    },
    '5p9iszmf': {
      'en': ' Price',
      'ar': 'سعر',
    },
    'vy2lmkhf': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'dopqndnf': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'gvvvyex5': {
      'en': 'Upload Housing',
      'ar': 'تحميل السكن',
    },
    'wl9m0osd': {
      'en': 'Fill out the information below to post a housing',
      'ar': 'قم بملء المعلومات أدناه لنشر السكن',
    },
    '7ozwzpky': {
      'en': 'Upload',
      'ar': 'رفع',
    },
  },
  // my_posts
  {
    'eyzlrnkc': {
      'en': 'Search all articles...',
      'ar': 'البحث في جميع المقالات...',
    },
    '0lkdvmcr': {
      'en': 'My Posts',
      'ar': 'منشوراتي',
    },
    'hqxn3uke': {
      'en': 'Read Now',
      'ar': 'اقرأ الآن',
    },
    'l0ktvgta': {
      'en': 'My Posts',
      'ar': '',
    },
    'i5v902hk': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // profile_info2
  {
    'tit931jg': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'rqhkuubq': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'h5abhxcj': {
      'en': 'Phone',
      'ar': 'هاتف',
    },
    'psxmu5pr': {
      'en': 'Age',
      'ar': 'عمر',
    },
    'odyhx45a': {
      'en': 'SSN',
      'ar': 'رقم الضمان الاجتماعي',
    },
    'czvc8phs': {
      'en': 'college',
      'ar': 'كلية',
    },
    'giusdm0q': {
      'en': 'Go Home',
      'ar': 'العودة إلى المنزل',
    },
    'k8yvc1jh': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    '1tms2g8e': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Edit_profile2
  {
    'o1unjhab': {
      'en': 'Upload Profile Image',
      'ar': 'تحميل صورة الملف الشخصي',
    },
    '5iw1i4l3': {
      'en': ' name',
      'ar': 'اسم',
    },
    'ivoxsw1v': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'ofml86yt': {
      'en': ' Email',
      'ar': 'بريد إلكتروني',
    },
    '6s88otha': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'mgz3avg6': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
    },
    'eaytggki': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
    },
    '8azoxfoj': {
      'en': ' Age',
      'ar': 'عمر',
    },
    'oi25xrhi': {
      'en': 'Age',
      'ar': 'عمر',
    },
    '00hyevwj': {
      'en': ' SSN',
      'ar': 'رقم الضمان الاجتماعي',
    },
    'n0309qg4': {
      'en': 'SSN',
      'ar': 'رقم الضمان الاجتماعي',
    },
    '84pum5bx': {
      'en': ' college',
      'ar': 'كلية',
    },
    'brjdbyxl': {
      'en': 'college',
      'ar': 'كلية',
    },
    'gmn33jsj': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'ptsy2b2n': {
      'en': 'Edit  Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'xgukr39p': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // cpay
  {
    'davc2i1r': {
      'en': 'Payment Confirmed!',
      'ar': 'تم تأكيد الدفع!',
    },
    'wh146zqd': {
      'en': '00.00 EGP',
      'ar': '00.00 جنيه مصري',
    },
    '6sodf1lr': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'ar':
          'لقد تم تأكيد الدفع الخاص بك، قد يستغرق الأمر من ساعة إلى ساعتين حتى تتم عملية الدفع الخاصة بك وتظهر في قائمة المعاملات الخاصة بك.',
    },
    '7ky0jiaj': {
      'en': 'Mastercard Ending in 4021',
      'ar': 'بطاقة ماستركارد تنتهي بالرقم 4021',
    },
    'j7w0drxd': {
      'en': 'Visa Ending in 4021',
      'ar': 'تأشيرة تنتهي بـ 4021',
    },
    '8a4x0ifs': {
      'en': 'Cash number Ending in 4021',
      'ar': 'رقم نقدي ينتهي بـ 4021',
    },
    'kp25tl8h': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ppayy
  {
    '3qfpu8na': {
      'en': 'complete payment details',
      'ar': 'تفاصيل الدفع الكاملة',
    },
    '1lismyuo': {
      'en': ' Please enter owner cash numder',
      'ar': 'الرجاء إدخال رقم الحساب النقدي للمالك',
    },
    '5j3rjetw': {
      'en': ' Please enter your code',
      'ar': 'الرجاء إدخال الرمز الخاص بك',
    },
    'l6vgobh7': {
      'en': 'Total Price :  ',
      'ar': 'السعر الإجمالي :',
    },
    'ko3bfckz': {
      'en': '00.00 EGP',
      'ar': '00.00 جنيه مصري',
    },
    'w66ic01x': {
      'en': 'Pay Now',
      'ar': 'ادفع الآن',
    },
    'ieja3zic': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // notification
  {
    'c2lsfpxo': {
      'en': 'Notifications',
      'ar': 'إشعارات',
    },
    'psw71cg3': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // allreviews
  {
    '1gdrgwdu': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Createprofile
  {
    'i5s2gbu7': {
      'en': 'Upload Profile Image',
      'ar': 'تحميل صورة الملف الشخصي',
    },
    'ewedn046': {
      'en': ' name',
      'ar': 'اسم',
    },
    'ii1tmuef': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'no3ut5w6': {
      'en': ' Email',
      'ar': 'بريد إلكتروني',
    },
    'cuz3650z': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'kpcwekao': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
    },
    'w00s2p8t': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
    },
    'lgb1z2gd': {
      'en': 'Age',
      'ar': 'عمر',
    },
    'd9iu2ird': {
      'en': 'Age',
      'ar': 'عمر',
    },
    'hr9lskq1': {
      'en': 'Gender',
      'ar': 'جنس',
    },
    '3d5ontls': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'n7cwfbhe': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'qlmjkn7p': {
      'en': 'male',
      'ar': 'ذكر',
    },
    'egfumym3': {
      'en': 'female ',
      'ar': 'أنثى',
    },
    '8ikvoy78': {
      'en': 'SSN ',
      'ar': 'رقم الضمان الاجتماعي',
    },
    '7na7hl7n': {
      'en': 'SSN',
      'ar': 'رقم الضمان الاجتماعي',
    },
    'lp1ostvu': {
      'en': 'college ',
      'ar': 'كلية',
    },
    'f534t2kk': {
      'en': 'college',
      'ar': 'كلية',
    },
    'p8oigbed': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'h6on17mn': {
      'en': 'create  Profile',
      'ar': 'إنشاء ملف تعريفي',
    },
    'f39c13pg': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // notificationOwner
  {
    'pmor9zrp': {
      'en': ' Request',
      'ar': 'طلب',
    },
    'zbhv1svi': {
      'en': 'you have  a request to your housing',
      'ar': 'لديك طلب إلى سكنك',
    },
    'vtd99xzj': {
      'en': 'Notification',
      'ar': 'إشعار',
    },
    '2nk6q1oe': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // calendarView
  {
    'z7le9o4z': {
      'en': 'Close',
      'ar': 'يغلق',
    },
  },
  // addReview
  {
    'gefvlx9x': {
      'en': 'Write Review...',
      'ar': 'اكتب مراجعة...',
    },
    'lbq0u3px': {
      'en': 'LEAVEREVIEW',
      'ar': 'مراجعة الإجازة',
    },
  },
  // filltter
  {
    'x0nzqnsw': {
      'en': 'Requirements ',
      'ar': 'متطلبات',
    },
    '4beww3z9': {
      'en': 'fill out the Requirements .....',
      'ar': 'إملأ المتطلبات.....',
    },
    '3enap4bv': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'qpjtsjh6': {
      'en': 'choice :',
      'ar': 'خيار :',
    },
    'fv9oiqid': {
      'en': 'Bed',
      'ar': 'سرير',
    },
    'pifqbkd8': {
      'en': 'Room',
      'ar': 'غرفة',
    },
    'p00acu95': {
      'en': 'Flat',
      'ar': 'مستوي',
    },
    'nzfkod93': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'a2kf0etc': {
      'en': 'Rooms :',
      'ar': 'الغرف :',
    },
    '586qoez4': {
      'en': '1',
      'ar': '1',
    },
    '0jedgb51': {
      'en': '2',
      'ar': '2',
    },
    'oowtcqha': {
      'en': '3',
      'ar': '3',
    },
    '6cwsjbww': {
      'en': '4',
      'ar': '4',
    },
    'uqc9cgf9': {
      'en': '5',
      'ar': '5',
    },
    '4fxlqqwq': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'rc9xx2nh': {
      'en': 'Beds :',
      'ar': 'الأسرة :',
    },
    'zn567ojt': {
      'en': '1',
      'ar': '1',
    },
    'pfnnvqub': {
      'en': '2',
      'ar': '2',
    },
    '6o3bt7jg': {
      'en': '3',
      'ar': '3',
    },
    'nuumevy8': {
      'en': '4',
      'ar': '4',
    },
    'o6u7g0uw': {
      'en': '5',
      'ar': '5',
    },
    'xt4xoihc': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'z1894x3n': {
      'en': 'Baths :',
      'ar': 'الحمامات :',
    },
    '9cl4r8td': {
      'en': '1',
      'ar': '1',
    },
    'ql5y1uti': {
      'en': '2',
      'ar': '2',
    },
    'zv9n617p': {
      'en': '3',
      'ar': '3',
    },
    'wffnlsf4': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
  },
  // comments2
  {
    '3etcvgit': {
      'en': 'Create Note',
      'ar': 'إنشاء ملاحظة',
    },
    'd11jvugb': {
      'en': 'TextField',
      'ar': 'حقل النص',
    },
    'obmmn430': {
      'en': 'label here....',
      'ar': 'ضع علامة هنا....',
    },
  },
  // filters
  {
    'xgs2brdv': {
      'en': 'fill out the Requirements .....',
      'ar': 'إملأ المتطلبات.....',
    },
    'xh1xhafc': {
      'en': 'choice :',
      'ar': 'خيار :',
    },
    'gme188ln': {
      'en': 'Bed',
      'ar': 'سرير',
    },
    'ak0j2qtq': {
      'en': 'Room',
      'ar': 'غرفة',
    },
    '5oy0r0dy': {
      'en': 'Flat',
      'ar': 'مستوي',
    },
    'hm4ivdtu': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'ik6gb345': {
      'en': 'Electronics :',
      'ar': 'الالكترونيات :',
    },
    's586n1sp': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    'r64iac7i': {
      'en': 'Washing Machine',
      'ar': 'غسالة ملابس',
    },
    'ke3xudd7': {
      'en': 'Fridge',
      'ar': 'ثلاجة',
    },
    'vcqlr7yn': {
      'en': 'Gas Stove',
      'ar': 'موقد غاز',
    },
    'n6fq2xbm': {
      'en': 'TV',
      'ar': 'تلفزيون',
    },
    'uova1ypa': {
      'en': 'Iron',
      'ar': 'حديد',
    },
    'z489k1aq': {
      'en': 'Desk',
      'ar': 'مكتب',
    },
    '96b787kv': {
      'en': 'WiFi',
      'ar': 'واي فاي',
    },
    'errkms80': {
      'en': 'Air Conditioner',
      'ar': 'مكيف الهواء',
    },
    'zkpltxj9': {
      'en': 'Heater',
      'ar': 'سخان',
    },
    '26us2acw': {
      'en': 'Tops',
      'ar': 'قمم',
    },
    'nicypo6t': {
      'en': 'The range of price :',
      'ar': 'نطاق السعر :',
    },
    'hslrv69e': {
      'en': 'Min Price',
      'ar': 'الحد الأدنى للسعر',
    },
    '52uokrrt': {
      'en': 'Max Price',
      'ar': 'السعر الأقصى',
    },
    'cbfwi8uu': {
      'en': 'Create Product',
      'ar': 'إنشاء المنتج',
    },
    '70fozvrl': {
      'en': 'Beds and Rooms :',
      'ar': 'الأسرة والغرف :',
    },
    'reljua7w': {
      'en': 'Rooms ',
      'ar': 'الغرف',
    },
    'vkwzkc9b': {
      'en': 'Beds ',
      'ar': 'أسرة',
    },
    'kt61549p': {
      'en': 'Baths ',
      'ar': 'الحمامات',
    },
    '5290xsc8': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    '9c8pi30y': {
      'en': 'Clear Filter',
      'ar': 'مسح الفلتر',
    },
  },
  // notificationstudent
  {
    'a3c385tj': {
      'en': 'Notification',
      'ar': 'إشعار',
    },
  },
  // notificationowner1
  {
    'kiaawfz2': {
      'en': 'Notification',
      'ar': 'إشعار',
    },
  },
  // Miscellaneous
  {
    'sm7vo2xs': {
      'en': '',
      'ar': '',
    },
    'yhwwhj2y': {
      'en': '',
      'ar': '',
    },
    '8cy1bhrf': {
      'en': '',
      'ar': '',
    },
    'o4h2taaq': {
      'en': '',
      'ar': '',
    },
    '4ai6cvyd': {
      'en': '',
      'ar': '',
    },
    '2182teus': {
      'en': '',
      'ar': '',
    },
    'x2rbx1bs': {
      'en': '',
      'ar': '',
    },
    'wbz5sqet': {
      'en': '',
      'ar': '',
    },
    'nvc1e7vb': {
      'en': '',
      'ar': '',
    },
    'rm2jpcrs': {
      'en': '',
      'ar': '',
    },
    '3giou206': {
      'en': '',
      'ar': '',
    },
    'q2imyrj5': {
      'en': '',
      'ar': '',
    },
    '187fckfw': {
      'en': '',
      'ar': '',
    },
    'yb7iy4i1': {
      'en': '',
      'ar': '',
    },
    'ptfqrg9s': {
      'en': '',
      'ar': '',
    },
    'zr5bszy4': {
      'en': '',
      'ar': '',
    },
    'i28q1etd': {
      'en': '',
      'ar': '',
    },
    'al1plrft': {
      'en': '',
      'ar': '',
    },
    'cg6658lk': {
      'en': '',
      'ar': '',
    },
    'deezqvyt': {
      'en': '',
      'ar': '',
    },
    'a71j0jxv': {
      'en': '',
      'ar': '',
    },
    'vowv3hch': {
      'en': '',
      'ar': '',
    },
    't1w8v326': {
      'en': '',
      'ar': '',
    },
    'w2o3w1s0': {
      'en': '',
      'ar': '',
    },
    'dzi9u07k': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
