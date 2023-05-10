class Task {
  String id;
  String title;
  String desc;
  int date;
  bool isChecked;
  Task({
    this.id = '',
    required this.title,
    required this.desc,
    required this.date,
    this.isChecked = false,
  });

  Task.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'] as String,
          id: json['id'] as String,
          desc: json['desc'] as String,
          date: json['date'] as int,
          isChecked: json['isChecked'] as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "date": date,
      "isChecked": isChecked,
    };
  }
}
