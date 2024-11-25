class ProfileModel {
  late String id;
  late String name;
  late String email;
  late String phone;
  late String image;

  ProfileModel(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      );

  ProfileModel.fromJson(Map<String, dynamic>? json, {data}) {
    id = json!['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
