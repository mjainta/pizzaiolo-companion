class Log {
  late DateTime created;
  late int poolishRestHr;
  late int ballNoMultiplier;
  late String notableChanges;
  late String roomTemperature;
  late int ratingProcessability;
  late int ratingFluffyness;
  late int ratingTaste;
  late String ratingNotes;

  Log.fromRecord(record) {
    Map<String, dynamic> data = record.data;
    created = DateTime.parse(data['created'] ?? 'now');
    poolishRestHr = data['poolish_rest_hr'] ?? 0;
    ballNoMultiplier = data['ball_no_multiplier'] ?? 0;
    notableChanges = data['notable_changes'] ?? 0;
    roomTemperature = data['room_temperature'] ?? 0;
    ratingProcessability = data['rating_processability'] ?? 0;
    ratingFluffyness = data['rating_fluffyness'] ?? 0;
    ratingTaste = data['rating_taste'] ?? 0;
    ratingNotes = data['rating_notes'] ?? 0;
  }

  Log.fromValues(
    this.created,
    this.poolishRestHr,
    this.ballNoMultiplier,
    this.notableChanges,
    this.roomTemperature,
    this.ratingProcessability,
    this.ratingFluffyness,
    this.ratingTaste,
    this.ratingNotes,
  );
}
