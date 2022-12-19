//
//  File.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import Foundation
struct UsersViewModel{
    var users: Observable<[Usermodel]> = Observable([])
}
//Observale class
class Observable<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    private var listener: ((T) -> Void)?
    init(_ value: T) {
        self.value = value
    }
    func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
//One way to load the JSON data
//class UserViewModel{
//    func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(T.self, from: data)
//                return jsonData
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
//}
