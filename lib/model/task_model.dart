class TaskModel {
  String title;
  String desc;
  bool isFinished;

  TaskModel({required this.title, this.desc = "", this.isFinished = false});

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "isFinished": isFinished,
      };

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json["title"],
      desc: json["desc"],
      isFinished: json["isFinished"],
    );
  }
}
