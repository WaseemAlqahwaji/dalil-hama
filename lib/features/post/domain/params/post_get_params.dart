
import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/params/post_location_input.dart';

class PostGetFilters {
  String? slug;
  String? title;

  PostGetFilters({this.slug, this.title});

  String parse() {
    String res =
        '''
    where: {
${title != null ? "title: { contains: \"${title?.trim()}\" }" : ""}
${slug != null ? "service: {slug: {eq: \"${slug?.trim()}\"}}" : ""}
    }
    ''';
    return res;
  }
}

class PostGetParams extends PaginationParams {
  String? after;
  int? first;
  PostLocationInput? locationInput;
  PostGetFilters? postGetFilters;

  PostGetParams({
    this.after,
    this.first,
    this.locationInput,
    this.postGetFilters,
  });

  String getGraphQlQuery() {
    String q =
        '''
    query {
      posts(
      ${first != null ? "first: $first" : ""}
      ${after != null ? "after: \"$after\"" : ""}
      ${locationInput != null ? "locationInput: { longitude: ${locationInput!.longitude}, latitude: ${locationInput!.latitude}, radiusInM: ${locationInput!.radiusInM} }" : ""}
      ${postGetFilters?.parse() != null ? postGetFilters!.parse() : ""}
      )
     {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
      id
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
