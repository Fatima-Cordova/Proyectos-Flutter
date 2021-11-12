class TaskModel {
  late String name;
  bool? completed;

  TaskModel(this.name, this.completed);

  Map<String, dynamic> toMap() {
    return {
      "name" : name,
    };
  }

  TaskModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
  }
}
