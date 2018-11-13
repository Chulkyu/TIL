import Foundation

struct Dog: Codable {
    let age: Int
    let name: String
}

func codableBasic() {
    let jsonData = """
    {
        "age": 3,
        "name": "Maru"
    }
""".data(using: .utf8)!
    
    guard let dog1 = try! JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
        let age = dog1["age"] as? Int,
        let name = dog1["name"] as? String
        else { return }
    
    let dog = Dog(age: age, name: name)
    print(dog.age)
    print(dog.name)
    
    let dog2 = try! JSONDecoder().decode(Dog.self, from: jsonData)
    
    print(dog2.age)
    print(dog2.name)
    
}

func codableArray() {
    print("\n------------ [ array ] -------------\n")
    let jsonData = """
    [
        { "age": 3, "name": "Tory" },
        { "age": 3, "name": "Tory" },
    ]
""".data(using: .utf8)!
    print(jsonData)
    
    // JSONSerialization
    let jsonObject = try! JSONSerialization.jsonObject(with: jsonData) as! [[String: Any]]
    let first = jsonObject.first!
    print(Dog(age: first["age"] as! Int, name: first["name"] as! String))
    
    // Codable
    let dogs = try! JSONDecoder().decode([Dog].self, from: jsonData)
    dogs.forEach { print($0) }
    
}

func codableDictionary() {
    print("\n------------ [ dictionary ] -------------\n")
    let jsonData = """
    { "first": {
        "age": 3,
        "name": "Tory"
    },
        "second": {
        "age": 4,
        "name": "Tory"
        }
    }
""".data(using: .utf8)!
    
    // JSONSerialization
    let dogs1 = try! JSONSerialization.jsonObject(with: jsonData) as! [String: [String: Any]]
    let first = dogs1["first"]!
    print(Dog(age: first["age"] as! Int, name: first["name"] as! String))
    
    // Codable
    let dogs = try! JSONDecoder().decode([String: Dog].self, from: jsonData)
    dogs.forEach { print($0, $1) }
    
}

codableArray()
codableBasic()
codableDictionary()


// Nested Codable

struct Astronauts: Decodable {
    let message: String
    let number: Int
    let people: [Person]  // [[String: String]]
    
    struct Person: Decodable {
        let name: String  // 딕셔너리 안에 가져오고 싶은 것만 선택
    }
}

let jsonString = """
{
    "message": "success",
    "number": 3,
    "people": [
        { "craft": "ISS", "name": "Anton Shkaplerov" },
        { "craft": "ISS", "name": "Scott Tingle" },
        { "craft": "ISS", "name": "Norishige Kanai" },
    ]
}
"""

let jsonData = jsonString.data(using: .utf8)!

do {
    let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonData)
    print(astronauts.message)
    print(astronauts.number)
    astronauts.people.forEach { print($0)}
} catch {
    print(error.localizedDescription)
}

// Nested Keys

let jsonString1 = """
        [
        {
        "latitude": 30.0,
        "longitude": 40.0,
        "additionalInfo": {
        "elevation": 50.0
                }
            },
        {
        "latitude": 60.0,
        "longitude": 120.0,
        "additionalInfo": {
        "elevation": 20.0
                }
            }
        ]
        """

struct Coordinate {
    var latitude: Double
    var longitude: Double
    var elevation: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case additionalInfo
    }
    enum AdditionalInfoKeys: String, CodingKey {
        case elevation
    }
}

extension Coordinate: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
        
        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}

extension Coordinate: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        
        var additionalInfo = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        try additionalInfo.encode(elevation, forKey: .elevation)
    }
}

let jsonData1 = jsonString1.data(using: .utf8)!
do {
    let objects = try JSONDecoder().decode([Coordinate].self, from: jsonData1)
    objects.forEach { print($0) }
    
    let encoded = try JSONEncoder().encode(objects.first!)
    let decoded = try JSONDecoder().decode(Coordinate.self, from: encoded)
    print("encoded :", encoded)
    print("decoded :", decoded)
} catch {
    print(error.localizedDescription)
}


// Handle Download Data
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


struct Repositories: Decodable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    struct Repository: Decodable {
        let fullName: String
        let description: String?
        let starCount: Int
        let forkCount: Int
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case description = "description"
            case starCount = "stargazers_count"
            case forkCount = "forks_count"
            case url = "html_url"
        }
    }
}


// https://developer.github.com/v3      // github api document
let urlString = "https://api.github.com/search/repositories?q=language:swift+user:giftbott"

func fetchGitHubRepositories() {
    let url  = URL(string: urlString)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let response = response as? HTTPURLResponse, let data = data else { return }
        guard 200..<400 ~= response.statusCode else { return }
        do {
            let repositories = try JSONDecoder().decode(Repositories.self, from: data)
            for repository in repositories.items {
                print(repository.fullName)
                print(repository.description ?? "")
                print(repository.starCount)
                print("\n= = = = = = = = = = = = = = =\n")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    dataTask.resume()
}

fetchGitHubRepositories()


/***************************************************
 [ 실습 ]
 1.
 struct Repository 내부에 생략된 decoder 메서드를 추가하고 동일하게 동작하도록 구현
 init(from decoder: Decoder) throws {}
 
 2.
 문서를 보고 원하는 api 를 찾아 적용하는 연습
 swift 언어로 짜여진 Repository 중 star 가 높은 순서부터 출력하는 api url 을 찾아 내용 출력
 ***************************************************/


