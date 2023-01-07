/// Enumeration for the three possibilities when writing the currency symbol.
enum SymbolAlign { left, right }

enum FractionalStyle { none, strike, cross, disable, ignore }

/// e.g. style1:   i/p 1552470.596   o/p 1,552,470.596
/// e.g. style2:   i/p 1552470.596   o/p 15,52,470.596
enum CurrencyValuePlaceStyle { none, style1, style2 }

class CurrencySymbol {
// none: remove symbol
  static const String none = "";

// Afghanistani Afghani
  static const String AFN = "؋";

// Armenian Dram
  static const String AMD = "դր";

// Azerbaijani Manat
  static const String AZN = "₼";

// Bahraini Dinar
  static const String BHD = ".د.ب";

// Bangladeshi Taka
  static const String BDT = "৳";

// Cambodian Riel
  static const String KHR = "៛";

// Chinese Yuan Renminbi
  static const String CNY = "元";

// Georgian Lari
  static const String GEL = "ლ";

// Indian Rupee
  static const String INR = "₹";

// Iranian Rial
  static const String IRR = "﷼";

// Iraqi Dinar
  static const String IQD = "ع.د";

// Israeli New Sheqel
  static const String ILS = "₪";

// Japanese Yen
  static const String JPY = "¥";

// Jordanian Dinar
  static const String JOD = "د.ا";

// Kazakhstani Tenge
  static const String KZT = "лв";

// Kuwaiti Dinar
  static const String KWD = "د.ك";

// Kyrgyzstani Som
  static const String KGS = "лв";

// Lao Kip
  static const String LAK = "₭";

// Mongolian Tugrik
  static const String MNT = "₮";

// North Korean Won
  static const String KPW = "₩";

// Omani Rial
  static const String OMR = "﷼";

// Philippine Peso
  static const String PHP = "₱";

// Qatari Riyal
  static const String QAR = "﷼";

// Russian Ruble
  static const String RUB = "₽";

// Saudi Arabian Riyal
  static const String SAR = "﷼";

// Korean Won
  static const String KRW = "₩";

// Thai Baht
  static const String THB = "฿";

// United States Dollar
  static const String USD = "\$";

// Turkish New Lira
  static const String TRY = "₺";

// United Arab Emirates Dirham
  static const String AED = "د.إ";

// Uzbekistani Som
  static const String UZS = "лв";

// Viet Nam Dong
  static const String VND = "₫";

// Yemeni Rial
  static const String YER = "﷼";

// Algerian Dinar
  static const String DZD = "دج";

// Eritrean Nakfa
  static const String ERN = "ናቕፋ";

// Ethiopian Birr
  static const String ETB = "ብር";

// Libyan Dinar
  static const String LYD = "ل.د";

// Nigerian Naira
  static const String NGN = "₦";

// Tunisian Dinar
  static const String TND = "د.ت";

// European Euro
  static const String EUR = "€";

// Bulgarian Lev
  static const String BGN = "лв";

// Macedonian Denar
  static const String MKD = "ден";

// Maltese Lira
  static const String MTL = "₤";

// Polish Zloty
  static const String PLN = "zł";

// Serbian Dinar
  static const String RSD = "Дин.";

// Ukrainian Hryvnia
  static const String UAH = "₴";

// United Kingdom Pound Sterling
  static const String GBP = "£";

// Costa Rican Colon
  static const String CRC = "₡";
}
