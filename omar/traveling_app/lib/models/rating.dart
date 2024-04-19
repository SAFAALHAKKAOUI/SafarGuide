class Rating {
  int id; // Identifiant unique de l'évaluation
  double score; // Note attribuée
  String review; // Avis donné

  Rating({
    required this.id,
    required this.score,
    required this.review,
  });

  // Méthode pour convertir un objet Map en objet Rating
  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      id: map['id'],
      score: map['score'],
      review: map['review'],
    );
  }

  // Méthode pour convertir un objet Rating en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'score': score,
      'review': review,
    };
  }
}
