class ApiString {
  static const String bookDetailUrl = "https://book.douban.com/subject/";
  static const String bookActivitiesJsonUrl =
      "https://book.douban.com/j/home/activities";
  static const String bookExpressJsonUrl =
      "https://book.douban.com/j/home/express_books";
  static const String bookDoubanHomeUrl = "https://book.douban.com";
  static const String bookActivityCoverReg = r"https:.*(?='\))";
  static const String ua =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';
  static const String bookIdReg = r'(?<=/subject/)\d+(?=/)';
  static const String bookPageRegExp = r'(?<=页数:)\s{1,}\d{2,}';
  static const String bookPriceRegExp = r'(?<=定价:)\s{1,}\d{2,}';
  static const String authorIdRegExp = r'(?<=author/)\d+(?=/)';

  static String getBookActivityCover(String? style) {
    if (style == null) return "";
    return RegExp(bookActivityCoverReg).stringMatch(style) ?? "";
  }

  static String getId(String content, String reg) {
    return RegExp(reg).stringMatch(content) ?? "";
  }

  static int getBookPage(String? text) {
    if (text == null || text.isEmpty) return 0;
    return int.parse(RegExp(bookPageRegExp).stringMatch(text) ?? "0");
  }

  static double getBookPrice(String? text) {
    if (text == null || text.isEmpty) return 0;
    return double.parse(RegExp(bookPriceRegExp).stringMatch(text) ?? "0");
  }
}
