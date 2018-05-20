//  This file was automatically generated and should not be edited.

import Apollo

public final class FetchMoviesByGeLiQuery: GraphQLQuery {
  public static let operationString =
    "query FetchMoviesBy_GeLi($genre: String!, $limit: Int!) {\n  Movies(filter: {limit: $limit}, by: {genres: $genre}) {\n    __typename\n    title\n    year\n    mpa_rating\n    rating\n    runtime\n    synopsis\n    genres\n    imdb_code\n    trailer_code\n    small_cover_image\n    medium_cover_image\n    large_cover_image\n    background_image_original\n  }\n}"

  public var genre: String
  public var limit: Int

  public init(genre: String, limit: Int) {
    self.genre = genre
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["genre": genre, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Movies", arguments: ["filter": ["limit": GraphQLVariable("limit")], "by": ["genres": GraphQLVariable("genre")]], type: .list(.object(Movie.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(movies: [Movie?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "Movies": movies.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (snapshot["Movies"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Movie(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes = ["Movie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("year", type: .nonNull(.scalar(Int.self))),
        GraphQLField("mpa_rating", type: .nonNull(.scalar(String.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("runtime", type: .nonNull(.scalar(Double.self))),
        GraphQLField("synopsis", type: .nonNull(.scalar(String.self))),
        GraphQLField("genres", type: .nonNull(.list(.scalar(String.self)))),
        GraphQLField("imdb_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("trailer_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("small_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("medium_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("large_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image_original", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String, year: Int, mpaRating: String, rating: Double, runtime: Double, synopsis: String, genres: [String?], imdbCode: String, trailerCode: String, smallCoverImage: String, mediumCoverImage: String, largeCoverImage: String, backgroundImageOriginal: String) {
        self.init(snapshot: ["__typename": "Movie", "title": title, "year": year, "mpa_rating": mpaRating, "rating": rating, "runtime": runtime, "synopsis": synopsis, "genres": genres, "imdb_code": imdbCode, "trailer_code": trailerCode, "small_cover_image": smallCoverImage, "medium_cover_image": mediumCoverImage, "large_cover_image": largeCoverImage, "background_image_original": backgroundImageOriginal])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var year: Int {
        get {
          return snapshot["year"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "year")
        }
      }

      public var mpaRating: String {
        get {
          return snapshot["mpa_rating"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mpa_rating")
        }
      }

      public var rating: Double {
        get {
          return snapshot["rating"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "rating")
        }
      }

      public var runtime: Double {
        get {
          return snapshot["runtime"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "runtime")
        }
      }

      public var synopsis: String {
        get {
          return snapshot["synopsis"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "synopsis")
        }
      }

      public var genres: [String?] {
        get {
          return snapshot["genres"]! as! [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "genres")
        }
      }

      public var imdbCode: String {
        get {
          return snapshot["imdb_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imdb_code")
        }
      }

      public var trailerCode: String {
        get {
          return snapshot["trailer_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "trailer_code")
        }
      }

      public var smallCoverImage: String {
        get {
          return snapshot["small_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_cover_image")
        }
      }

      public var mediumCoverImage: String {
        get {
          return snapshot["medium_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medium_cover_image")
        }
      }

      public var largeCoverImage: String {
        get {
          return snapshot["large_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "large_cover_image")
        }
      }

      public var backgroundImageOriginal: String {
        get {
          return snapshot["background_image_original"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image_original")
        }
      }
    }
  }
}

public final class FetchMoviesByGeLiOfQuery: GraphQLQuery {
  public static let operationString =
    "query FetchMoviesBy_GeLiOf($genre: String!, $limit: Int!, $offset: Int!) {\n  Movies(filter: {limit: $limit, offset: $offset}, by: {genres: $genre}) {\n    __typename\n    title\n    year\n    mpa_rating\n    rating\n    runtime\n    synopsis\n    genres\n    imdb_code\n    trailer_code\n    small_cover_image\n    medium_cover_image\n    large_cover_image\n    background_image_original\n  }\n}"

  public var genre: String
  public var limit: Int
  public var offset: Int

  public init(genre: String, limit: Int, offset: Int) {
    self.genre = genre
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["genre": genre, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Movies", arguments: ["filter": ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], "by": ["genres": GraphQLVariable("genre")]], type: .list(.object(Movie.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(movies: [Movie?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "Movies": movies.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (snapshot["Movies"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Movie(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes = ["Movie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("year", type: .nonNull(.scalar(Int.self))),
        GraphQLField("mpa_rating", type: .nonNull(.scalar(String.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("runtime", type: .nonNull(.scalar(Double.self))),
        GraphQLField("synopsis", type: .nonNull(.scalar(String.self))),
        GraphQLField("genres", type: .nonNull(.list(.scalar(String.self)))),
        GraphQLField("imdb_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("trailer_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("small_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("medium_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("large_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image_original", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String, year: Int, mpaRating: String, rating: Double, runtime: Double, synopsis: String, genres: [String?], imdbCode: String, trailerCode: String, smallCoverImage: String, mediumCoverImage: String, largeCoverImage: String, backgroundImageOriginal: String) {
        self.init(snapshot: ["__typename": "Movie", "title": title, "year": year, "mpa_rating": mpaRating, "rating": rating, "runtime": runtime, "synopsis": synopsis, "genres": genres, "imdb_code": imdbCode, "trailer_code": trailerCode, "small_cover_image": smallCoverImage, "medium_cover_image": mediumCoverImage, "large_cover_image": largeCoverImage, "background_image_original": backgroundImageOriginal])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var year: Int {
        get {
          return snapshot["year"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "year")
        }
      }

      public var mpaRating: String {
        get {
          return snapshot["mpa_rating"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mpa_rating")
        }
      }

      public var rating: Double {
        get {
          return snapshot["rating"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "rating")
        }
      }

      public var runtime: Double {
        get {
          return snapshot["runtime"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "runtime")
        }
      }

      public var synopsis: String {
        get {
          return snapshot["synopsis"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "synopsis")
        }
      }

      public var genres: [String?] {
        get {
          return snapshot["genres"]! as! [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "genres")
        }
      }

      public var imdbCode: String {
        get {
          return snapshot["imdb_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imdb_code")
        }
      }

      public var trailerCode: String {
        get {
          return snapshot["trailer_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "trailer_code")
        }
      }

      public var smallCoverImage: String {
        get {
          return snapshot["small_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_cover_image")
        }
      }

      public var mediumCoverImage: String {
        get {
          return snapshot["medium_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medium_cover_image")
        }
      }

      public var largeCoverImage: String {
        get {
          return snapshot["large_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "large_cover_image")
        }
      }

      public var backgroundImageOriginal: String {
        get {
          return snapshot["background_image_original"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image_original")
        }
      }
    }
  }
}

public final class FetchMoviesByGeLiOfSbQuery: GraphQLQuery {
  public static let operationString =
    "query FetchMoviesBy_GeLiOfSb($genre: String!, $limit: Int!, $offset: Int!, $sort_By: String!) {\n  Movies(filter: {limit: $limit, offset: $offset, sort_by: $sort_By}, by: {genres: $genre}) {\n    __typename\n    title\n    year\n    mpa_rating\n    rating\n    runtime\n    synopsis\n    genres\n    imdb_code\n    trailer_code\n    small_cover_image\n    medium_cover_image\n    large_cover_image\n    background_image_original\n  }\n}"

  public var genre: String
  public var limit: Int
  public var offset: Int
  public var sort_By: String

  public init(genre: String, limit: Int, offset: Int, sort_By: String) {
    self.genre = genre
    self.limit = limit
    self.offset = offset
    self.sort_By = sort_By
  }

  public var variables: GraphQLMap? {
    return ["genre": genre, "limit": limit, "offset": offset, "sort_By": sort_By]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Movies", arguments: ["filter": ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset"), "sort_by": GraphQLVariable("sort_By")], "by": ["genres": GraphQLVariable("genre")]], type: .list(.object(Movie.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(movies: [Movie?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "Movies": movies.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (snapshot["Movies"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Movie(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes = ["Movie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("year", type: .nonNull(.scalar(Int.self))),
        GraphQLField("mpa_rating", type: .nonNull(.scalar(String.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("runtime", type: .nonNull(.scalar(Double.self))),
        GraphQLField("synopsis", type: .nonNull(.scalar(String.self))),
        GraphQLField("genres", type: .nonNull(.list(.scalar(String.self)))),
        GraphQLField("imdb_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("trailer_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("small_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("medium_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("large_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image_original", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String, year: Int, mpaRating: String, rating: Double, runtime: Double, synopsis: String, genres: [String?], imdbCode: String, trailerCode: String, smallCoverImage: String, mediumCoverImage: String, largeCoverImage: String, backgroundImageOriginal: String) {
        self.init(snapshot: ["__typename": "Movie", "title": title, "year": year, "mpa_rating": mpaRating, "rating": rating, "runtime": runtime, "synopsis": synopsis, "genres": genres, "imdb_code": imdbCode, "trailer_code": trailerCode, "small_cover_image": smallCoverImage, "medium_cover_image": mediumCoverImage, "large_cover_image": largeCoverImage, "background_image_original": backgroundImageOriginal])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var year: Int {
        get {
          return snapshot["year"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "year")
        }
      }

      public var mpaRating: String {
        get {
          return snapshot["mpa_rating"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mpa_rating")
        }
      }

      public var rating: Double {
        get {
          return snapshot["rating"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "rating")
        }
      }

      public var runtime: Double {
        get {
          return snapshot["runtime"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "runtime")
        }
      }

      public var synopsis: String {
        get {
          return snapshot["synopsis"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "synopsis")
        }
      }

      public var genres: [String?] {
        get {
          return snapshot["genres"]! as! [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "genres")
        }
      }

      public var imdbCode: String {
        get {
          return snapshot["imdb_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imdb_code")
        }
      }

      public var trailerCode: String {
        get {
          return snapshot["trailer_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "trailer_code")
        }
      }

      public var smallCoverImage: String {
        get {
          return snapshot["small_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_cover_image")
        }
      }

      public var mediumCoverImage: String {
        get {
          return snapshot["medium_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medium_cover_image")
        }
      }

      public var largeCoverImage: String {
        get {
          return snapshot["large_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "large_cover_image")
        }
      }

      public var backgroundImageOriginal: String {
        get {
          return snapshot["background_image_original"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image_original")
        }
      }
    }
  }
}

public final class FetchMoviesByGeLiOfSbOrQuery: GraphQLQuery {
  public static let operationString =
    "query FetchMoviesBy_GeLiOfSbOr($genre: String!, $limit: Int!, $offset: Int!, $sort_By: String!, $order: String!) {\n  Movies(filter: {limit: $limit, offset: $offset, sort_by: $sort_By, order: $order}, by: {genres: $genre}) {\n    __typename\n    title\n    year\n    mpa_rating\n    rating\n    runtime\n    synopsis\n    genres\n    imdb_code\n    trailer_code\n    small_cover_image\n    medium_cover_image\n    large_cover_image\n    background_image_original\n  }\n}"

  public var genre: String
  public var limit: Int
  public var offset: Int
  public var sort_By: String
  public var order: String

  public init(genre: String, limit: Int, offset: Int, sort_By: String, order: String) {
    self.genre = genre
    self.limit = limit
    self.offset = offset
    self.sort_By = sort_By
    self.order = order
  }

  public var variables: GraphQLMap? {
    return ["genre": genre, "limit": limit, "offset": offset, "sort_By": sort_By, "order": order]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Movies", arguments: ["filter": ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset"), "sort_by": GraphQLVariable("sort_By"), "order": GraphQLVariable("order")], "by": ["genres": GraphQLVariable("genre")]], type: .list(.object(Movie.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(movies: [Movie?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "Movies": movies.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (snapshot["Movies"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Movie(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes = ["Movie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("year", type: .nonNull(.scalar(Int.self))),
        GraphQLField("mpa_rating", type: .nonNull(.scalar(String.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("runtime", type: .nonNull(.scalar(Double.self))),
        GraphQLField("synopsis", type: .nonNull(.scalar(String.self))),
        GraphQLField("genres", type: .nonNull(.list(.scalar(String.self)))),
        GraphQLField("imdb_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("trailer_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("small_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("medium_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("large_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image_original", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String, year: Int, mpaRating: String, rating: Double, runtime: Double, synopsis: String, genres: [String?], imdbCode: String, trailerCode: String, smallCoverImage: String, mediumCoverImage: String, largeCoverImage: String, backgroundImageOriginal: String) {
        self.init(snapshot: ["__typename": "Movie", "title": title, "year": year, "mpa_rating": mpaRating, "rating": rating, "runtime": runtime, "synopsis": synopsis, "genres": genres, "imdb_code": imdbCode, "trailer_code": trailerCode, "small_cover_image": smallCoverImage, "medium_cover_image": mediumCoverImage, "large_cover_image": largeCoverImage, "background_image_original": backgroundImageOriginal])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var year: Int {
        get {
          return snapshot["year"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "year")
        }
      }

      public var mpaRating: String {
        get {
          return snapshot["mpa_rating"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mpa_rating")
        }
      }

      public var rating: Double {
        get {
          return snapshot["rating"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "rating")
        }
      }

      public var runtime: Double {
        get {
          return snapshot["runtime"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "runtime")
        }
      }

      public var synopsis: String {
        get {
          return snapshot["synopsis"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "synopsis")
        }
      }

      public var genres: [String?] {
        get {
          return snapshot["genres"]! as! [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "genres")
        }
      }

      public var imdbCode: String {
        get {
          return snapshot["imdb_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imdb_code")
        }
      }

      public var trailerCode: String {
        get {
          return snapshot["trailer_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "trailer_code")
        }
      }

      public var smallCoverImage: String {
        get {
          return snapshot["small_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_cover_image")
        }
      }

      public var mediumCoverImage: String {
        get {
          return snapshot["medium_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medium_cover_image")
        }
      }

      public var largeCoverImage: String {
        get {
          return snapshot["large_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "large_cover_image")
        }
      }

      public var backgroundImageOriginal: String {
        get {
          return snapshot["background_image_original"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image_original")
        }
      }
    }
  }
}

public final class SearchMoviesQuery: GraphQLQuery {
  public static let operationString =
    "query SearchMovies($target: String!, $resultSize: Int!) {\n  MoviesSearch(query: $target, resultSize: $resultSize) {\n    __typename\n    title\n    year\n    mpa_rating\n    rating\n    runtime\n    synopsis\n    genres\n    imdb_code\n    trailer_code\n    small_cover_image\n    medium_cover_image\n    large_cover_image\n    background_image_original\n  }\n}"

  public var target: String
  public var resultSize: Int

  public init(target: String, resultSize: Int) {
    self.target = target
    self.resultSize = resultSize
  }

  public var variables: GraphQLMap? {
    return ["target": target, "resultSize": resultSize]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("MoviesSearch", arguments: ["query": GraphQLVariable("target"), "resultSize": GraphQLVariable("resultSize")], type: .list(.object(MoviesSearch.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(moviesSearch: [MoviesSearch?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "MoviesSearch": moviesSearch.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var moviesSearch: [MoviesSearch?]? {
      get {
        return (snapshot["MoviesSearch"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { MoviesSearch(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "MoviesSearch")
      }
    }

    public struct MoviesSearch: GraphQLSelectionSet {
      public static let possibleTypes = ["Movie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("year", type: .nonNull(.scalar(Int.self))),
        GraphQLField("mpa_rating", type: .nonNull(.scalar(String.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("runtime", type: .nonNull(.scalar(Double.self))),
        GraphQLField("synopsis", type: .nonNull(.scalar(String.self))),
        GraphQLField("genres", type: .nonNull(.list(.scalar(String.self)))),
        GraphQLField("imdb_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("trailer_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("small_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("medium_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("large_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image_original", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String, year: Int, mpaRating: String, rating: Double, runtime: Double, synopsis: String, genres: [String?], imdbCode: String, trailerCode: String, smallCoverImage: String, mediumCoverImage: String, largeCoverImage: String, backgroundImageOriginal: String) {
        self.init(snapshot: ["__typename": "Movie", "title": title, "year": year, "mpa_rating": mpaRating, "rating": rating, "runtime": runtime, "synopsis": synopsis, "genres": genres, "imdb_code": imdbCode, "trailer_code": trailerCode, "small_cover_image": smallCoverImage, "medium_cover_image": mediumCoverImage, "large_cover_image": largeCoverImage, "background_image_original": backgroundImageOriginal])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var year: Int {
        get {
          return snapshot["year"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "year")
        }
      }

      public var mpaRating: String {
        get {
          return snapshot["mpa_rating"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mpa_rating")
        }
      }

      public var rating: Double {
        get {
          return snapshot["rating"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "rating")
        }
      }

      public var runtime: Double {
        get {
          return snapshot["runtime"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "runtime")
        }
      }

      public var synopsis: String {
        get {
          return snapshot["synopsis"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "synopsis")
        }
      }

      public var genres: [String?] {
        get {
          return snapshot["genres"]! as! [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "genres")
        }
      }

      public var imdbCode: String {
        get {
          return snapshot["imdb_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imdb_code")
        }
      }

      public var trailerCode: String {
        get {
          return snapshot["trailer_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "trailer_code")
        }
      }

      public var smallCoverImage: String {
        get {
          return snapshot["small_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_cover_image")
        }
      }

      public var mediumCoverImage: String {
        get {
          return snapshot["medium_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medium_cover_image")
        }
      }

      public var largeCoverImage: String {
        get {
          return snapshot["large_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "large_cover_image")
        }
      }

      public var backgroundImageOriginal: String {
        get {
          return snapshot["background_image_original"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image_original")
        }
      }
    }
  }
}

public final class GetMovieQuery: GraphQLQuery {
  public static let operationString =
    "query GetMovie($imdbCode: String!) {\n  Movie(imdbCode: $imdbCode) {\n    __typename\n    title\n    title_long\n    title_english\n    imdb_code\n    language\n    synopsis\n    summary\n    description_full\n    year\n    slug\n    trailer_code\n    runtime\n    rating\n    mpa_rating\n    resource_name\n    resource_id\n    date_uploaded\n    date_uploaded_unix\n    small_cover_image\n    medium_cover_image\n    large_cover_image\n    background_image\n    background_image_original\n    genres\n    subtitles\n  }\n}"

  public var imdbCode: String

  public init(imdbCode: String) {
    self.imdbCode = imdbCode
  }

  public var variables: GraphQLMap? {
    return ["imdbCode": imdbCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Movie", arguments: ["imdbCode": GraphQLVariable("imdbCode")], type: .object(Movie.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(movie: Movie? = nil) {
      self.init(snapshot: ["__typename": "Query", "Movie": movie.flatMap { $0.snapshot }])
    }

    public var movie: Movie? {
      get {
        return (snapshot["Movie"] as? Snapshot).flatMap { Movie(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "Movie")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes = ["Movie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("title_long", type: .nonNull(.scalar(String.self))),
        GraphQLField("title_english", type: .nonNull(.scalar(String.self))),
        GraphQLField("imdb_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("language", type: .nonNull(.scalar(String.self))),
        GraphQLField("synopsis", type: .nonNull(.scalar(String.self))),
        GraphQLField("summary", type: .nonNull(.scalar(String.self))),
        GraphQLField("description_full", type: .nonNull(.scalar(String.self))),
        GraphQLField("year", type: .nonNull(.scalar(Int.self))),
        GraphQLField("slug", type: .nonNull(.scalar(String.self))),
        GraphQLField("trailer_code", type: .nonNull(.scalar(String.self))),
        GraphQLField("runtime", type: .nonNull(.scalar(Double.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("mpa_rating", type: .nonNull(.scalar(String.self))),
        GraphQLField("resource_name", type: .nonNull(.scalar(String.self))),
        GraphQLField("resource_id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("date_uploaded", type: .nonNull(.scalar(String.self))),
        GraphQLField("date_uploaded_unix", type: .nonNull(.scalar(String.self))),
        GraphQLField("small_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("medium_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("large_cover_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image", type: .nonNull(.scalar(String.self))),
        GraphQLField("background_image_original", type: .nonNull(.scalar(String.self))),
        GraphQLField("genres", type: .nonNull(.list(.scalar(String.self)))),
        GraphQLField("subtitles", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String, titleLong: String, titleEnglish: String, imdbCode: String, language: String, synopsis: String, summary: String, descriptionFull: String, year: Int, slug: String, trailerCode: String, runtime: Double, rating: Double, mpaRating: String, resourceName: String, resourceId: Int, dateUploaded: String, dateUploadedUnix: String, smallCoverImage: String, mediumCoverImage: String, largeCoverImage: String, backgroundImage: String, backgroundImageOriginal: String, genres: [String?], subtitles: String? = nil) {
        self.init(snapshot: ["__typename": "Movie", "title": title, "title_long": titleLong, "title_english": titleEnglish, "imdb_code": imdbCode, "language": language, "synopsis": synopsis, "summary": summary, "description_full": descriptionFull, "year": year, "slug": slug, "trailer_code": trailerCode, "runtime": runtime, "rating": rating, "mpa_rating": mpaRating, "resource_name": resourceName, "resource_id": resourceId, "date_uploaded": dateUploaded, "date_uploaded_unix": dateUploadedUnix, "small_cover_image": smallCoverImage, "medium_cover_image": mediumCoverImage, "large_cover_image": largeCoverImage, "background_image": backgroundImage, "background_image_original": backgroundImageOriginal, "genres": genres, "subtitles": subtitles])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var titleLong: String {
        get {
          return snapshot["title_long"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title_long")
        }
      }

      public var titleEnglish: String {
        get {
          return snapshot["title_english"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title_english")
        }
      }

      public var imdbCode: String {
        get {
          return snapshot["imdb_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imdb_code")
        }
      }

      public var language: String {
        get {
          return snapshot["language"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "language")
        }
      }

      public var synopsis: String {
        get {
          return snapshot["synopsis"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "synopsis")
        }
      }

      public var summary: String {
        get {
          return snapshot["summary"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "summary")
        }
      }

      public var descriptionFull: String {
        get {
          return snapshot["description_full"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description_full")
        }
      }

      public var year: Int {
        get {
          return snapshot["year"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "year")
        }
      }

      public var slug: String {
        get {
          return snapshot["slug"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "slug")
        }
      }

      public var trailerCode: String {
        get {
          return snapshot["trailer_code"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "trailer_code")
        }
      }

      public var runtime: Double {
        get {
          return snapshot["runtime"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "runtime")
        }
      }

      public var rating: Double {
        get {
          return snapshot["rating"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "rating")
        }
      }

      public var mpaRating: String {
        get {
          return snapshot["mpa_rating"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "mpa_rating")
        }
      }

      public var resourceName: String {
        get {
          return snapshot["resource_name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "resource_name")
        }
      }

      public var resourceId: Int {
        get {
          return snapshot["resource_id"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "resource_id")
        }
      }

      public var dateUploaded: String {
        get {
          return snapshot["date_uploaded"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "date_uploaded")
        }
      }

      public var dateUploadedUnix: String {
        get {
          return snapshot["date_uploaded_unix"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "date_uploaded_unix")
        }
      }

      public var smallCoverImage: String {
        get {
          return snapshot["small_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "small_cover_image")
        }
      }

      public var mediumCoverImage: String {
        get {
          return snapshot["medium_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "medium_cover_image")
        }
      }

      public var largeCoverImage: String {
        get {
          return snapshot["large_cover_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "large_cover_image")
        }
      }

      public var backgroundImage: String {
        get {
          return snapshot["background_image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image")
        }
      }

      public var backgroundImageOriginal: String {
        get {
          return snapshot["background_image_original"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "background_image_original")
        }
      }

      public var genres: [String?] {
        get {
          return snapshot["genres"]! as! [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "genres")
        }
      }

      public var subtitles: String? {
        get {
          return snapshot["subtitles"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subtitles")
        }
      }
    }
  }
}