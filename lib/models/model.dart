class Login {
  final String userId;
  final String email;
  final String name;
  final String platform;
  final List<dynamic> books;

  Login(this.userId, this.email, this.name, this.platform, this.books);

  Login.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        email = json['email'],
        name = json['name'],
        platform = json['platform'],
        books = json['books'];


  Map<String, dynamic> toJson() => {
        'userId': userId,
        'email': email,
        'name': name,
        'platform': platform,
        'books': books
      };
}