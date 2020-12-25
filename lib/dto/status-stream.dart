class StatusStream {
  bool isOnline;

  StatusStream(this.isOnline);

  factory StatusStream.fromJson(dynamic json) {
    return StatusStream(json['is_online'] as bool);
  }

  @override
  String toString() {
    return '{ ${this.isOnline} }';
  }
}
