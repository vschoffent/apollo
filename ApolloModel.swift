import Foundation

struct Apollo_Musicas: Codable, Hashable {
    var _id: String?
    var _rev: String?
    var imagem: String?
    var nome_musica: String?
    var artista: String?
    var album: String?
    var genero: String?
    var audio: String?
    var voto: Int?
}

struct Apollo_Evento: Codable, Hashable {
    var _id: String?
    var _rev: String?
    var nome_evento: String?
    var nome_organizador: String?
    var codigo: String?
    var avaliacao: Int?
    var musicas: [Apollo_Musicas]?
    var ativa: Bool?
}

struct MyVariables {
    static var music_selected : [Apollo_Musicas] = []
}

class ApolloModel : ObservableObject {
    @Published var musics : [Apollo_Musicas] = []
    @Published var events : [Apollo_Evento] = []
    
    func getAllMusics(){
        guard let url = URL(string: "http://192.168.128.247:1880/apolloGETMusicas" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Apollo_Musicas].self, from: data)
                
                DispatchQueue.main.async {
                    self?.musics = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getAllEvents(){
        guard let url = URL(string: "http://192.168.128.247:1880/apolloGETEventos" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Apollo_Evento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.events = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func insert_event(){
        //let json: [String: Any] = ["title": "ABC","1":"First", "2":"Second"]
        
        //let teste = Pessoa(temperatura: "10", pressao: "20", altitude: "30", time: "40")
        
        
        
        //let jsonData = try? JSONSerialization.data(withJSONObject: teste.json)
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(events.last)
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        jsonEncoder.outputFormatting = .prettyPrinted
        jsonEncoder.dateEncodingStrategy = .iso8601
        
        var jsonString = String(data: jsonData, encoding: .utf8)!
        
        print(jsonData)
        

        // create post request
        let url = URL(string: "http://192.168.128.247:1880/postapollo")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // insert json data to the request
        request.httpBody = jsonData
        print(jsonData)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            
            print(data)
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }

        task.resume()
    }
    
    func remove_music_array(music_selected : Apollo_Musicas) {
        if let location = musics.firstIndex(where: {$0 == music_selected}) {
            musics.remove(at: location)
        }
    }
    
    
}
