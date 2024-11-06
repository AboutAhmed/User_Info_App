class UserModel {
  final int id;
  final String name;
  final String email;
  final Address address;
  final Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }

  // Added getter methods for address and company properties
  String get addressStreet => address.street;
  String get addressCity => address.city;
  String get companyName => company.name;
}

class Address {
  final String street;
  final String suite;
  final String city;

  Address({
    required this.street,
    required this.suite,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
    );
  }
}

class Company {
  final String name;

  Company({
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
    );
  }
}
