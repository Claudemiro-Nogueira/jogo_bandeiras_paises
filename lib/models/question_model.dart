class Question {
  // Question have a id
  final String id;
  // Question have a title
  final String title;


  // Question have a option
  // {"1":true, "2":false}
  // final Map<String, bool> options;

  Question( {
    required this.id,
    required this.title,
  });

  @override
  String toString() {
    return "Question(id: $id, title: $title)";
  }
}
