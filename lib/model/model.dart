class Model {
  String Probability;
  // String Status;
  Model({required this.Probability});
  factory Model.fromJson(dynamic body) {
    var jsonData = body['cnn'];
    return Model(
      Probability: jsonData['Probability'],
      // Status: jsonData['Status'],
    );

  }
  @override
  String toString() {
    // TODO: implement toString
    return Probability;
  }
}
