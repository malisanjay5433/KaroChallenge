//
//  File.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import Foundation
struct Usermodel : Codable {
    let id : Int?
    let name : String?
    let username : String?
    let email : String?
    let address : Address?
    let phone : String?
    let website : String?
    let company : Company?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        company = try values.decodeIfPresent(Company.self, forKey: .company)
    }

}
// MARK: - Address
struct Address : Codable {
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : Geo?

    enum CodingKeys: String, CodingKey {

        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        suite = try values.decodeIfPresent(String.self, forKey: .suite)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
    }

}
// MARK: - Company

struct Company : Codable {
    let name : String?
    let catchPhrase : String?
    let bs : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
        bs = try values.decodeIfPresent(String.self, forKey: .bs)
    }

}

// MARK: - Geo
struct Geo : Codable {
    let lat : String?
    let lng : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
    }

}

struct StaffpickModel:Codable {
        let rating : Double?
        let id : Int?
        let revenue : Int?
        let releaseDate : String?
        let director : LoopDirector?
        let posterUrl : String?
        let cast : [LoopCast]?
        let runtime : Int?
        let title : String?
        let overview : String?
        let reviews : Int?
        let budget : Int?
        let language : String?
        let genres : [String]?

        enum CodingKeys: String, CodingKey {

            case rating = "rating"
            case id = "id"
            case revenue = "revenue"
            case releaseDate = "releaseDate"
            case director = "director"
            case posterUrl = "posterUrl"
            case cast = "cast"
            case runtime = "runtime"
            case title = "title"
            case overview = "overview"
            case reviews = "reviews"
            case budget = "budget"
            case language = "language"
            case genres = "genres"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            rating = try values.decodeIfPresent(Double.self, forKey: .rating)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
            releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
            director = try values.decodeIfPresent(LoopDirector.self, forKey: .director)
            posterUrl = try values.decodeIfPresent(String.self, forKey: .posterUrl)
            cast = try values.decodeIfPresent([LoopCast].self, forKey: .cast)
            runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            overview = try values.decodeIfPresent(String.self, forKey: .overview)
            reviews = try values.decodeIfPresent(Int.self, forKey: .reviews)
            budget = try values.decodeIfPresent(Int.self, forKey: .budget)
            language = try values.decodeIfPresent(String.self, forKey: .language)
            genres = try values.decodeIfPresent([String].self, forKey: .genres)
        }

    }
    struct LoopDirector : Codable {
        let name : String?
        let pictureUrl : String?

        enum CodingKeys: String, CodingKey {

            case name = "name"
            case pictureUrl = "pictureUrl"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            pictureUrl = try values.decodeIfPresent(String.self, forKey: .pictureUrl)
        }

    }

    struct LoopCast : Codable {
        let name : String?
        let pictureUrl : String?
        let character : String?

        enum CodingKeys: String, CodingKey {

            case name = "name"
            case pictureUrl = "pictureUrl"
            case character = "character"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            pictureUrl = try values.decodeIfPresent(String.self, forKey: .pictureUrl)
            character = try values.decodeIfPresent(String.self, forKey: .character)
        }

    }
