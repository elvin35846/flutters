class RemoteApiModel {
  int userId;
  int id;
  String title;
  String body;

  RemoteApiModel.jsonToMap(Map<String, dynamic> mapName)
      : userId = mapName["userId"],
        id = mapName["id"],
        title = mapName["title"],
        body = mapName["body"];
}
