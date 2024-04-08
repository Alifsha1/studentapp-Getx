class StudentModel {
  int? id;
  final String name;
  String? domain;
  String? batch;
  String? image;

  StudentModel({
    required this.id,
    required this.name,
    required this.domain,
    required this.batch,
    required this.image,
  });

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        name: json["name"],
        domain: json["domain"],
        batch: json["batch"],
        image: json["image"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "domain": domain,
        "batch": batch,
        "image": image,
      };
}
