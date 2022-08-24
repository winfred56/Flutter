/// Candidate model
class Position {
  /// Constructor
  Position(this.position, this.id);

  /// Firebase document id
  final String id;

  /// Aspiring position
  final String position;


  /// toJson
  Position.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        position = json['position'];


  /// fromJson
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': position,
  };
}