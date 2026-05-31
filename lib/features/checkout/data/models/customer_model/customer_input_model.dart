class CustomerInputModel {

  final String name;


  const CustomerInputModel({
    
  required  this.name,
  
  });
  Map<String, dynamic> toJson() {
    return { 'name': name, };
  }
}
