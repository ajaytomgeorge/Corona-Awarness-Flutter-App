class   IndianState
 {
  String key;
  String name;
 
  IndianState({this.key, this.name});
 
  factory IndianState.fromJson(Map<String, dynamic> json) {
    return IndianState(
      key: json["key"] as String,
      name: json["name"] as String
    );
  }
}