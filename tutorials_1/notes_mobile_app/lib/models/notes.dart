class Notes {
  int id;
  int categoriesID;
  String title;
  String description;
  String createDate;
  int priority;

  Notes(this.categoriesID, this.title, this.description, this.createDate,
      this.priority);
  Notes.withID(this.id, this.categoriesID, this.title, this.description,
      this.createDate, this.priority);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["id"] = id;
    map["categoriesID"] = categoriesID;
    map["title"] = title;
    map["description"] = description;
    map["createDate"] = createDate;
    map["priority"] = priority;

    return map;
  }

  Notes.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.categoriesID = map["categoriesID"];
    this.title = map["title"];
    this.description = map["description"];
    this.createDate = map["createDate"];
    this.priority = map["priority"];
  }

  @override
  String toString() {
    return 'Notes{id: $id, categoriesID: $categoriesID, title: $title, description: $description, createDate: $createDate, priority: $priority}';
  }
}
