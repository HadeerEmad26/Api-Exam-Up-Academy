class EndPoint {
  static const String baseUrl = 'https://api.thecatapi.com/v1/images/';
  static const String endPoint='search';
  static const Map<String,dynamic> queryParameters ={
    "limit":80,
    "mime_types":"",
    "order":"Random",
    "size": "small",
    "page":3,
    "sub_id":"demo-ce06ee",
    "authuser":0
  };
  static const String pageNum='page=3';
  static const String url='https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&$pageNum&sub_id=demo-ce06ee';
}

class ApiKey{
  static const String id ='id';
  static const String subId='sub_id';
}

