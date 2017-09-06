import Foundation

extension String {
    func addingPercentEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

func encodeParametersInUrl(_ parameters: [String : Any]) -> String {
    var componets = [(String, String)]()
    
    let sortedKeys = parameters.keys.sorted(by: { $0 < $1 })
    
    for key in sortedKeys {
        let value = parameters[key]!
        let queryComponets = queryComponetsWith(key: key, value: value)
        componets.append(contentsOf: queryComponets)
    }
    
    let encodedComponets = componets.map { "\($0)=\($1)" }
    return encodedComponets.joined(separator: "&")
}

func queryComponetsWith(key: String, value: Any) -> [(String, String)] {
    var componets = [(String, String)]()
    
    if let dictionary = value as? [String : Any] {
        for (nestedKey, value) in dictionary {
            let nestedComponets = queryComponetsWith(key: "\(key)[\(nestedKey)]", value: value)
            componets.append(contentsOf: nestedComponets)
        }
    } else if let array = value as? [Any] {
        for value in array {
            let nestedComponets = queryComponetsWith(key: "\(key)[]", value: value)
            componets.append(contentsOf: nestedComponets)
        }
    } else {
        let encodedKey = key.addingPercentEncoding()
        let encodedValue = "\(value)".addingPercentEncoding()
        
        let componet = (encodedKey, encodedValue)
        componets.append(componet)
    }
    
    return componets
}
let parameters = ["foo" : ["a", 1, true]]
encodeParametersInUrl(parameters)































































































