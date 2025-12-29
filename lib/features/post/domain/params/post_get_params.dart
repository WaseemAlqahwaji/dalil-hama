import 'package:dalil_hama/features/core/domain/params/base_params.dart';

class PostGetParams extends BaseParams {
  String? title;
  String slug;
  String serviceId;
  String? after;
  int? first;

  PostGetParams({
    required this.slug,
    required this.serviceId,
    this.title,
    this.after,
    this.first,
  });

  String getGraphQlQuery() {
    String q =
        '''
    query {
      posts(
      slug: "$slug"
      ${first != null ? "first: $first" : ""}
      ${after != null ? "after: \"$after\"" : ""}
      ${title?.trim().isNotEmpty == true ? "where: { title: { contains: \"${title?.trim()}\" } }" : ""}
      )
     {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        title
        imageUrl
        createdAt
        payload
      }
      edges {
       cursor
    }
  }
}
    ''';
    return q;
  }
}

// query {
// posts(
// slug: "restaurants"
// after: "OQ=="
// where: { title: { contains: "" } }
// ) {
// pageInfo {
// hasNextPage
// endCursor
// }
// nodes {
// title
// createdAt
// payload
// }
// edges {
// cursor
// }
// }
// }
