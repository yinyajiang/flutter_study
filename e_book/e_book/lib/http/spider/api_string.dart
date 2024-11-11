class ApiString {
  static const String bookDoubanHomeUrl = "https://book.douban.com";
  static const String bookActivityCoverReg = r"https:.*(?='\))";

  static String getBookActivityCover(String? style) {
    if (style == null) return "";
    return RegExp(bookActivityCoverReg).stringMatch(style) ?? "";
  }
}
