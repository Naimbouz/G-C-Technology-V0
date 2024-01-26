// task_model.dart

class TaskModel {
  final String titre;
  final String description;
  final int idTechnicien;
  final String id;

  TaskModel({
    required this.titre,
    required this.description,
    required this.idTechnicien,
    required this.id,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      titre: json['titre'],
      description: json['description'],
      idTechnicien: json['id_Technicien'],
      id: json['id'],
    );
  }
}
