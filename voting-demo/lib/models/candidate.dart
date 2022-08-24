/// Candidate model
class Candidate {
  /// Constructor
  Candidate(this.name, this.position, this.id);

  /// Firebase document id
  final String id;

  /// Aspirant name
  final String name;

  /// Aspiring position
  final String position;

  /// toJson
  Candidate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        position = json['position'];

  /// fromJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'position': position,
      };
}
