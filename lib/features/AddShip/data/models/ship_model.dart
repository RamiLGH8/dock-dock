class Ship {
  final String name;
  final int height;
  final int width;

  Ship({
    required this.name,
    required this.height,
    required this.width,
  });
  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
      name: json['name'],
      height: json['height'],
      width: json['width'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'height': height, 'width': width};
  }
}
