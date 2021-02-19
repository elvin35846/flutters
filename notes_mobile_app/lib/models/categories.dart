class Categories {
  int categoriesID;
  String categoriesTitle;

  Categories(this.categoriesTitle); //for write category
  Categories.withID(
      this.categoriesID, this.categoriesTitle); //for read category

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["categoriesID"] = categoriesID;
    map["categoriesTitle"] = categoriesTitle;

    return map;
  }

  Categories.fromMap(Map<String, dynamic> map) {
    this.categoriesID = map["categoriesID"];
    this.categoriesTitle = map["categoriesTitle"];
  }

  @override
  String toString() {
    return 'Categories{categoriesID: $categoriesID, categoriesTitle: $categoriesTitle}';
  }
}
