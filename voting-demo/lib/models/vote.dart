class Vote {
  /// Constructor
  Vote( this.candidate, this.votes);

  /// candidate
  /// -> References candidate from candidates collection
  final String candidate;

  /// Number of votes
  int votes = 0;

  /// toJson
  Vote.fromJson(Map<String, dynamic> json)
      :
        candidate = json['candidate'],
        votes = json['votes'];

  /// fromJson
  Map<String, dynamic> toJson() => {
        'candidate': candidate,
        'votes': votes,
      };
}
