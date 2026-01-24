import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/params/post_location_input.dart';

class PostGetParams extends PaginationParams {
  String? title;
  String? slug;
  String? after;
  int? first;
  PostLocationInput? locationInput;

  PostGetParams({
     this.slug,
    this.title,
    this.after,
    this.first,
    this.locationInput,
  });

  String getGraphQlQuery() {
    String q =
        '''
    query {
      posts(
      ${slug != null ? {slug: "$slug"} : ""}
      ${first != null ? "first: $first" : ""}
      ${after != null ? "after: \"$after\"" : ""}
      ${locationInput != null ? "locationInput: { longitude: ${locationInput!.longitude}, latitude: ${locationInput!.latitude}, radiusInM: ${locationInput!.radiusInM} }" : ""}
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
        location {
        longitude,
        latitude
        }
        service{
        id
        }
      }
      edges {
       cursor
    }
  }
}
    ''';
    return q;
  }

  @override
  void reset() {
    after = null;
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
