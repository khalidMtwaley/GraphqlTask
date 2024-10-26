class LighthouseSubscriptions {
  dynamic channel;

  LighthouseSubscriptions({this.channel});

  factory LighthouseSubscriptions.fromJson(Map<String, dynamic> json) {
    return LighthouseSubscriptions(
      channel: json['channel'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'channel': channel,
      };
}
