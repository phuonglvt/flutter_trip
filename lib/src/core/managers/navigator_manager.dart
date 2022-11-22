import 'package:get/get.dart';
import 'package:trip_demo/src/ui/routing/pop_result.dart';
import 'package:trip_demo/src/utils/app_pages.dart';

class NavigatorManager {
  String _pagePrevious = AppPages.allTrips;

  /// Use to navigation to page with [args] is param
  Future<PopResult> navigateToPage(String page, {dynamic args}) async {
    if (_pagePrevious != page) {
      _pagePrevious = page;
    }

    final result = await Get.toNamed(page, arguments: args);

    return result is PopResult
        ? result
        : PopResult(status: false, resultFromPage: "");
  }

  /// Use when want pop back page previous with PopResult is data return
  Future<void> popBack({PopResult? popResult}) async {
    Get.back(result: popResult);
  }

  Future<void> offNamed(String page, {dynamic args}) async {
    if (_pagePrevious != page) {
      _pagePrevious = page;
    }

    Get.offNamed(page, arguments: args);
  }

  Future<void> offNamedUntil(String page) async {
    if (_pagePrevious != page) {
      _pagePrevious = page;
    }

    Get.offNamedUntil(page, (route) => false);
  }
}
