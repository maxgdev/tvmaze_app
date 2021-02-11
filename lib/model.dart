// Created JSON datam with  
// https://app.quicktype.io/

class Show {
    Show({
        this.id,
        this.url,
        this.name,
        this.type,
        this.genres,
        this.officialSite,
        this.rating,        
        this.image,
        this.summary,

    });

    int id;
    String url;
    String name;
    Type type;
    List<String> genres;
    String officialSite;
    Rating rating;
    Image image;
    String summary;

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: typeValues.map[json["type"]],
        genres: List<String>.from(json["genres"].map((x) => x)),
        officialSite: json["officialSite"] == null ? null : json["officialSite"],
        rating: Rating.fromJson(json["rating"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": typeValues.reverse[type],
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "officialSite": officialSite == null ? null : officialSite,
        "rating": rating.toJson(),
        "image": image == null ? null : image.toJson(),
        "summary": summary,
    };
}

class Image {
    Image({
        this.medium,
        this.original,
    });

    String medium;
    String original;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class Rating {
    Rating({
        this.average,
    });

    double average;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] == null ? null : json["average"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average == null ? null : average,
    };
}


enum Type { SCRIPTED, DOCUMENTARY }

final typeValues = EnumValues({
    "Documentary": Type.DOCUMENTARY,
    "Scripted": Type.SCRIPTED
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

class SearchShow {

  Show show;

  SearchShow({this.show});

  factory SearchShow.fromJson(Map<String, dynamic> json) {
    return SearchShow(
      show: Show.fromJson(json['show']),
    );
  }
}