class Students {
  final int? id;
  final String code;
  final String name;
  final String dept;
  final String phone;

  Students({
    this.id, //auto increment라서 안 줄 수 있음
    required this.code,
    required this.name,
    required this.dept,
    required this.phone,
  });

  Students.fromMap(Map<String, dynamic> res) //생성자
      : id = res['id'],
        code = res['code'],
        name = res['name'],
        dept = res['dept'],
        phone = res['phone'];

  Map<String, Object?> toMap() {
    return {'id': id, 'code': code, 'name': name, 'dept': dept, 'phone': phone};
  }
}
