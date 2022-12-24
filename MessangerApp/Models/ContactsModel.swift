//
//  MessageModel.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 12.12.2022.
//

struct Information: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let registered: Registered
    let phone: String
    let picture: Picture
    
    var fullName: String {
        name.first + " " + name.last
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
}

struct Street: Decodable {
    let number: Int
    let name: String
}
struct Login: Decodable {
    let username: String
    let password: String
}

struct Registered: Decodable {
    let age: Int
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
