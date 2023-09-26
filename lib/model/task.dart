class Task {
  String? id;
  String? title;
  String? desc;
  DateTime? dateTime;
  bool? isDone;

  Task({
    this.id = '',
    required this.title,
    required this.desc,
    required this.dateTime,
    this.isDone = false,
  });

  Task.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          desc: json['desc'] as String,
          dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
          isDone: json['isDone'] as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "dateTime": dateTime!.millisecondsSinceEpoch,
      "isDone": isDone,
    };
  }
}
