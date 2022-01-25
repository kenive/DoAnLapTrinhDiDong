class DanhMuc {
  final int id;
  final String category;
  final String imageUrl;
  final int status;
  
  DanhMuc({
    required this.id,
    required this.category,
    required this.imageUrl,
    
    required this.status,
   
  });
  DanhMuc.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'],
        category = json['name'],
        status = json['status'];
        
        

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': imageUrl,
        'name': category,
        'status': status,
      };
}


/* class DanhMuc {
  final int id;
  final String imageUrl;
  final String category;
  DanhMuc({
    required this.id,
    required this.imageUrl,
    required this.category,
   
  });
  DanhMuc.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'],
        category = json['tenloaisanpham'];
        
        

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'tenloaisanpham': category,
      };
} */