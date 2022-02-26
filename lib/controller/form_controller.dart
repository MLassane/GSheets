import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  final void Function(String) callback;

  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxY4SSDHkaGHu4MIYMt75Z4BXF1WMGlq1w-DzCQu7I/dev";
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http
          .get(Uri.parse(URL + feedbackForm.toParams()))
          .then((value) => callback(convert.jsonDecode(value.body)['status']));
    } catch (e) {
      print(e);
    }
  }
}
