//
//  Kategori.swift
//  MovieDb-AF
//
//  Created by Nurşah on 26.02.2022.
//

import Foundation
import UIKit
struct Category : Decodable {
    let genres : [Genres]
}
struct Genres : Decodable {
    let id: String
    let name: String
}

