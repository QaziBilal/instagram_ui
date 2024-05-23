// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelUser {
  String time;
  String cateogry;
  bool morePictures;
  String description;
  ModelUser({
    required this.time,
    required this.cateogry,
    this.morePictures = false,
    this.description = "",
  });
}

List<ModelUser> usersPost = [
  ModelUser(time: "34", cateogry: "Wedding", morePictures: true),
  ModelUser(
      time: "14",
      cateogry: "Travel",
      description: "Hello this is the description and i am exist"),
  ModelUser(time: "24", cateogry: "Tour", morePictures: true),
  ModelUser(time: "44", cateogry: "Category", morePictures: true),
  ModelUser(time: "54", cateogry: "Mall", morePictures: true),
  ModelUser(
      time: "14",
      cateogry: "Travel",
      description: "Hello this is the description and i am exist"),
  ModelUser(time: "33", cateogry: "Sport", morePictures: true),
  ModelUser(time: "34", cateogry: "Wedding", morePictures: true),
  ModelUser(
      time: "14",
      cateogry: "Travel",
      description: "Hello this is the description and i am exist"),
  ModelUser(time: "24", cateogry: "Tour", morePictures: true),
  ModelUser(
      time: "14",
      cateogry: "Travel",
      description: "Hello this is the description and i am exist"),
  ModelUser(time: "54", cateogry: "Mall", morePictures: true),
  ModelUser(time: "23", cateogry: "Food", morePictures: true),
  ModelUser(time: "33", cateogry: "Sport", morePictures: true),
  ModelUser(time: "34", cateogry: "Wedding", morePictures: true),
  ModelUser(
      time: "14",
      cateogry: "Travel",
      description: "Hello this is the description and i am exist"),
  ModelUser(time: "24", cateogry: "Tour", morePictures: true),
  ModelUser(time: "44", cateogry: "Category", morePictures: true),
  ModelUser(
      time: "14",
      cateogry: "Travel",
      description: "Hello this is the description and i am exist"),
  ModelUser(time: "33", cateogry: "Sport", morePictures: true),
];
