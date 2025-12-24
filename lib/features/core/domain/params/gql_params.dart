class GqlQueryParams {
  String queryName;
  Map<String, dynamic>? params;
  List<String> fields;

  GqlQueryParams({
    required this.queryName,
    required this.params,
    required this.fields,
  });
}

String convertGqlQueryToString(GqlQueryParams params) {
  String query = 'query { ${params.queryName}';
  if (params.params != null && params.params?.isNotEmpty == true) {
    query += '(';
    params.params?.forEach((key, value) {
      query += '$key:';
      if(value is String){
        query += "\"$value\"";
      }else{
        query += "$value";
      }
      query += ",";
    });
    if (query.endsWith(",")) {
      query = query.substring(0, query.length - 1);
    }
    query += ') ';
  }
  query += '{';
  for (var field in params.fields) {
    query += "$field ";
  }
  query += '}}';
  return query;
}
