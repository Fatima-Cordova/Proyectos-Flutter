

class ListaFecha {
  int? id;
  String? title;
  String? description;
  String? category;
  String? date;
  int? finished;

  todoMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['description'] = description;
    mapping['category'] = category;
    mapping['date'] = date;
    mapping['finished'] = finished;
    
    return mapping;
  }

}