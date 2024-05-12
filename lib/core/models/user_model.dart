class UserModel {
  String? id;
  String? companyName;
  String? email;
  String? password;
  String? sectorType;
  String? streetName;
  String? commercialRegister;

  UserModel({
    this.id,
    required this.companyName,
    required this.email,
        this.password,
    required this.sectorType,
    this.streetName,
    this.commercialRegister

      });
  UserModel.fromFireStore(Map<String, dynamic> data) {
    id = data['id'];
    companyName = data['name'];
    email = data['email'];
    password = data['password'];
    sectorType = data['sectorType'];
    streetName = data['streetName'];
    commercialRegister = data['commercialRegister'];
  }
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'companyName': companyName,
      'email': email,
      'password': password,
      'sectorType': sectorType,
      'streetName': streetName,
      'commercialRegister': commercialRegister
    };
  }
}
