import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {
  // Open a web URL
  static Future<void> launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url as String);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  // Make a phone call
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri as String);
    } else {
      throw 'Could not launch phone call to $phoneNumber';
    }
  }

  // Send an SMS
  static Future<void> sendSms(String phoneNumber) async {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri as String);
    } else {
      throw 'Could not send SMS to $phoneNumber';
    }
  }

  // Send an email
  static Future<void> sendEmail(String email,
      {String? subject, String? body}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri as String);
    } else {
      throw 'Could not send email to $email';
    }
  }

  // Open Google Maps
  static Future<void> openMap(double latitude, double longitude) async {
    final Uri googleMapUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl as String);
    } else {
      throw 'Could not open Google Maps';
    }
  }

  // Open another app by scheme
  static Future<void> openAppByScheme(String appScheme) async {
    final Uri appUri = Uri(scheme: appScheme);
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri as String);
    } else {
      throw 'Could not open app with scheme $appScheme';
    }
  }
}
