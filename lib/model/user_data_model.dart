class CryptoModel {
  String? coin;
  String? network;
  String? wallet;

  CryptoModel(
      {required this.coin, required this.network, required this.wallet});

  ///fromJson
  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        coin: json['coin'], network: json['network'], wallet: json['wallet']);
  }
}

class CoordinateModel {
  double? lat;
  double? lng;

  CoordinateModel({required this.lat, required this.lng});

  ///fromJson
  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(lat: json['lat'], lng: json['lng']);
  }
}

class AddressModel {
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? state;
  String? stateCode;
  CoordinateModel? coordinates;

  AddressModel(
      {required this.address,
      required this.city,
      required this.country,
      required this.postalCode,
      required this.state,
      required this.stateCode,
      required this.coordinates});

  ///fromJson
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address: json['address'],
        city: json['city'],
        country: json['country'],
        postalCode: json['postalCode'],
        state: json['state'],
        stateCode: json['stateCode'],
        coordinates: CoordinateModel.fromJson(json['coordinates']));
  }
}

class CompanyModel {
  String? department;
  String? name;
  String? title;
  AddressModel? address;

  CompanyModel(
      {required this.department,
      required this.name,
      required this.title,
      required this.address});

  ///fromJson
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        department: json['department'],
        name: json['name'],
        title: json['title'],
        address: AddressModel.fromJson(json['address']));
  }
}

class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? iban;
  String? currency;

  BankModel(
      {required this.cardExpire,
      required this.cardNumber,
      required this.cardType,
      required this.iban,
      required this.currency});

  ///fromJson
  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        iban: json['iban'],
        currency: json['currency']);
  }
}

class HairModel {
  String? color;
  String? type;

  HairModel({required this.color, required this.type});

  ///fromJson
  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(color: json['color'], type: json['type']);
  }
}

class UserModel {
  AddressModel? address;
  int? age;
  BankModel? bank;
  String? birthDate;
  String? bloodGroup;
  CompanyModel? company;
  CryptoModel? crypto;
  String? ein;
  String? email;
  String? eyeColor;
  String? firstName;
  String? gender;
  HairModel? hair;
  num? height;
  int? id;
  String? image;
  String? ip;
  String? lastName;
  String? macAddress;
  String? maidenName;
  String? password;
  String? phone;
  String? role;
  String? ssn;
  String? university;
  String? userAgent;
  String? username;
  num? weight;

  UserModel(
      {required this.address,
      required this.age,
      required this.bank,
      required this.birthDate,
      required this.bloodGroup,
      required this.company,
      required this.crypto,
      required this.ein,
      required this.email,
      required this.eyeColor,
      required this.firstName,
      required this.gender,
      required this.hair,
      required this.height,
      required this.id,
      required this.image,
      required this.ip,
      required this.lastName,
      required this.macAddress,
      required this.maidenName,
      required this.password,
      required this.phone,
      required this.role,
      required this.ssn,
      required this.university,
      required this.userAgent,
      required this.username,
      required this.weight});

  ///fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        address: AddressModel.fromJson(json['address']),
        age: json['age'],
        bank: BankModel.fromJson(json['bank']),
        birthDate: json['birthDate'],
        bloodGroup: json['bloodGroup'],
        company: CompanyModel.fromJson(json['company']),
        crypto: CryptoModel.fromJson(json['crypto']),
        ein: json['ein'],
        email: json['email'],
        eyeColor: json['eyeColor'],
        firstName: json['firstName'],
        gender: json['gender'],
        hair: HairModel.fromJson(json['hair']),
        height: json['height'],
        id: json['id'],
        image: json['image'],
        ip: json['ip'],
        lastName: json['lastName'],
        macAddress: json['macAddress'],
        maidenName: json['maidenName'],
        password: json['password'],
        phone: json['phone'],
        role: json['role'],
        ssn: json['ssn'],
        university: json['university'],
        userAgent: json['userAgent'],
        username: json['username'],
        weight: json['weight']);
  }
}

class UserDataModel {
  int? limit;
  int? skip;
  int? total;
  List<UserModel>? users;

  UserDataModel(
      {required this.limit,
      required this.skip,
      required this.total,
      required this.users});

  ///fromJson
  factory UserDataModel.fromJson(Map<String, dynamic> json) {

    List<UserModel>? mUsers = [];

    for(Map<String, dynamic> eachUser in json['users']){
      mUsers.add(UserModel.fromJson(eachUser));
    }

    return UserDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        users: mUsers);
  }
}
