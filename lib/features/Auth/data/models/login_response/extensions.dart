import 'lighthouse_subscriptions.dart';

class Extensions {
  LighthouseSubscriptions? lighthouseSubscriptions;

  Extensions({this.lighthouseSubscriptions});

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        lighthouseSubscriptions: json['lighthouse_subscriptions'] == null
            ? null
            : LighthouseSubscriptions.fromJson(
                json['lighthouse_subscriptions'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'lighthouse_subscriptions': lighthouseSubscriptions?.toJson(),
      };
}
