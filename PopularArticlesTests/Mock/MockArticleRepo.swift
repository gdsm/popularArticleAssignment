//
//  MockArticleRepo.swift
//  PopularArticlesTests
//
//  Created by Gagandeep on 23/02/24.
//

import XCTest

struct MockArticleRepo {
    
    static let stubArticleData = """
        {
          "status": "OK",
          "copyright": "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
          "num_results": 20,
          "results": [
            {
              "uri": "nyt://article/73dcc5f7-5bd8-5fb0-9963-55e6f93674ec",
              "url": "https://www.nytimes.com/2024/02/22/opinion/russia-ukraine-invasion-putin.html",
              "id": 100000009315520,
              "asset_id": 100000009315520,
              "source": "New York Times",
              "published_date": "2024-02-22",
              "updated": "2024-02-22 22:05:27",
              "section": "Opinion",
              "subsection": "",
              "nytdsection": "opinion",
              "adx_keywords": "Russian Invasion of Ukraine (2022);Putin, Vladimir V;North Atlantic Treaty Organization;European Union;Russia;Ukraine",
              "column": null,
              "byline": "By Rajan Menon",
              "type": "Article",
              "title": "Putin Has Already Lost",
              "abstract": "Ukraine will never be his.",
              "des_facet": [
                "Russian Invasion of Ukraine (2022)"
              ],
              "org_facet": [
                "North Atlantic Treaty Organization",
                "European Union"
              ],
              "per_facet": [
                "Putin, Vladimir V"
              ],
              "geo_facet": [
                "Russia",
                "Ukraine"
              ],
              "media": [
                {
                  "type": "image",
                  "subtype": "photo",
                  "caption": "",
                  "copyright": "Natalia Kolesnikova/Agence France-Presse — Getty Images",
                  "approved_for_syndication": 1,
                  "media-metadata": [
                    {
                      "url": "https://static01.nyt.com/images/2024/02/23/multimedia/22menon-jltz/22menon-jltz-thumbStandard-v4.jpg",
                      "format": "Standard Thumbnail",
                      "height": 75,
                      "width": 75
                    },
                    {
                      "url": "https://static01.nyt.com/images/2024/02/23/multimedia/22menon-jltz/22menon-jltz-mediumThreeByTwo210.jpg",
                      "format": "mediumThreeByTwo210",
                      "height": 140,
                      "width": 210
                    },
                    {
                      "url": "https://static01.nyt.com/images/2024/02/23/multimedia/22menon-jltz/22menon-jltz-mediumThreeByTwo440.jpg",
                      "format": "mediumThreeByTwo440",
                      "height": 293,
                      "width": 440
                    }
                  ]
                }
              ],
              "eta_id": 0
            },
            {
              "uri": "nyt://article/fce8afde-f6bf-5a27-bf56-91d7f1def088",
              "url": "https://www.nytimes.com/2024/02/22/arts/music/jennifer-lopez-this-is-me-now.html",
              "id": 100000009315306,
              "asset_id": 100000009315306,
              "source": "New York Times",
              "published_date": "2024-02-22",
              "updated": "2024-02-22 15:04:10",
              "section": "Arts",
              "subsection": "Music",
              "nytdsection": "arts",
              "adx_keywords": "Movies;Pop and Rock Music;Lopez, Jennifer;Meyers, Dave (1972- )",
              "column": null,
              "byline": "By Wesley Morris",
              "type": "Article",
              "title": "J. Lo and Behold: Is She for Real?",
              "abstract": "“This Is Me … Now: A Love Story,” a movie built on her latest album, is a showcase for the exhausting, never-ending, hazardous work of being Jennifer Lopez.",
              "des_facet": [
                "Movies",
                "Pop and Rock Music"
              ],
              "org_facet": [],
              "per_facet": [
                "Lopez, Jennifer",
                "Meyers, Dave (1972- )"
              ],
              "geo_facet": [],
              "media": [
                {
                  "type": "image",
                  "subtype": "photo",
                  "caption": "Jennifer Lopez searches for romance, and herself, in her Amazon movie “This Is Me … Now: A Love Story.”",
                  "copyright": "Prime, via Associated Press",
                  "approved_for_syndication": 1,
                  "media-metadata": [
                    {
                      "url": "https://static01.nyt.com/images/2024/02/21/multimedia/21jlo-notebook-ktzp/21jlo-notebook-ktzp-thumbStandard.jpg",
                      "format": "Standard Thumbnail",
                      "height": 75,
                      "width": 75
                    },
                    {
                      "url": "https://static01.nyt.com/images/2024/02/21/multimedia/21jlo-notebook-ktzp/21jlo-notebook-ktzp-mediumThreeByTwo210.jpg",
                      "format": "mediumThreeByTwo210",
                      "height": 140,
                      "width": 210
                    },
                    {
                      "url": "https://static01.nyt.com/images/2024/02/21/multimedia/21jlo-notebook-ktzp/21jlo-notebook-ktzp-mediumThreeByTwo440.jpg",
                      "format": "mediumThreeByTwo440",
                      "height": 293,
                      "width": 440
                    }
                  ]
                }
              ],
              "eta_id": 0
            }
          ]
        }
    """
}
