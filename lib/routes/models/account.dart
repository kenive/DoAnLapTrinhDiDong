class Account {
  final int id;
  final String username;
  final String password;
  final String? email;
  final String? phone;
  final String? address;
  final String? fullName;
  final int? isAdmin;
  final String? avatar;
  final int? status;
  /* final DateTime? create;
  final DateTime? update;
  final DateTime? delete; */
  Account({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.address,
    required this.fullName,
    
    required this.isAdmin,
    required this.avatar,
    required this.status,
    /* required this.delete,
    required this.update,
    required this.create,
     */
  });

  Account.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['userName'],
        password = json['Password'],
        email = json['Email'],
        phone = json['Phone'],
        address = json['Address'],
        fullName = json['FullName'],
        isAdmin = json['isadmin'],
        avatar = json['avatar'],
        status = json['status'];
        /* create = json['created_at'],
        update =json['updated_at'],
        delete = json['deleted_at']; */


        

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': username,
        'Password': password,
        'Email': email,
        'Phone': phone,
        'Address': address,
        'FullName': fullName, 
        'isadmin': isAdmin,
        'avatar': avatar,
        'status': status,
       /*  'created_at': create,
        'updated_at': update,
        'deleted_at	': delete, */
       
      };
}




