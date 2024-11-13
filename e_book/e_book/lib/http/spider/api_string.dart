class ApiString {
  static const String bookDoubanHomeUrl = "https://book.douban.com";
  static const String bookActivityCoverReg = r"https:.*(?='\))";
  static const String ua =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';

  static String getBookActivityCover(String? style) {
    if (style == null) return "";
    return RegExp(bookActivityCoverReg).stringMatch(style) ?? "";
  }
}
