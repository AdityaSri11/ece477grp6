import Foundation

func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        completion(data, error)
    }.resume()
}

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let coord: Coord
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}

func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    let fahrenheit = (kelvin - 273.15) * 9/5 + 32
    return fahrenheit
}

let weatherSymbols: [String: String] = [
    "clear": "☀️",
    "sunny": "☀️",
    "cloud": "☁️",
    "clouds": "☁️",
    "rain": "🌧️",
    "snow": "❄️",
    "thunderstorm": "⛈️",
    "mist": "🌫️",
]

func mapDescriptionToSymbol(_ description: String) -> String {
    var symbol = "❓"
    let words = description.components(separatedBy: " ")

    for word in words {
        if let foundSymbol = weatherSymbols[word] {
            symbol = foundSymbol
            break
        }
    }

    return symbol
}

func printWeatherInfo(city: String, temperature: Double, description: String) {
    let formattedTemperature = String(format: "%.2f", temperature)
    let weatherSymbol = mapDescriptionToSymbol(description)
    print("City: \(city)")
    print("Temperature: \(formattedTemperature)°F")
    print("Description: \(description)")
    print("Symbol: \(weatherSymbol)\n")
}

func getWeatherData(city: String, apiKey: String, completion: @escaping (WeatherData?, Error?) -> Void) {
    let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity!)&appid=\(apiKey)"
    
    if let url = URL(string: apiUrl) {
        fetchData(from: url) { data, error in
            if let error = error {
                completion(nil, error)
                return
            }

            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                completion(weatherData, nil)
            } catch {
                completion(nil, error)
            }
        }
    } else {
        let invalidURLError = NSError(domain: "com.yourapp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid API URL."])
        completion(nil, invalidURLError)
    }
}

func getTimeZoneInfo(latitude: Double, longitude: Double, apiKey: String, completion: @escaping (String?, Error?) -> Void) {
    let urlString = "https://maps.googleapis.com/maps/api/timezone/json?location=\(latitude),\(longitude)&timestamp=\(Int(Date().timeIntervalSince1970))&key=\(apiKey)"
    
    if let url = URL(string: urlString) {
        fetchData(from: url) { data, error in
            if let error = error {
                completion(nil, error)
                return
            }

            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any],
                   let timeZoneId = jsonObject["timeZoneId"] as? String {
                    completion(timeZoneId, nil)
                } else {
                    completion(nil, NSError(domain: "com.yourapp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to parse time zone data."]))
                }
            } catch {
                completion(nil, error)
            }
        }
    } else {
        completion(nil, NSError(domain: "com.yourapp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."]))
    }
}

func printCurrentTimeForTimeZone(timeZoneId: String) {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(identifier: timeZoneId)
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let currentTime = dateFormatter.string(from: Date())
    print("Current time in \(timeZoneId): \(currentTime)")
}

func weatherAPI() {
    let openWeatherApiKey = ""
    let googleApiKey = ""
    let city = "West Lafayette"

    getWeatherData(city: city, apiKey: openWeatherApiKey) { weatherData, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            exit(1)
        }

        if let weatherData = weatherData {
            let temperatureKelvin = weatherData.main.temp
            let temperature = kelvinToFahrenheit(temperatureKelvin)
            let weatherDescription = weatherData.weather.first?.description ?? "Unknown"
            let latitude = weatherData.coord.lat
            let longitude = weatherData.coord.lon
            printWeatherInfo(city: city, temperature: temperature, description: weatherDescription)

            getTimeZoneInfo(latitude: latitude, longitude: longitude, apiKey: googleApiKey) { timeZoneId, error in
                if let error = error {
                    print("Error fetching time zone: \(error.localizedDescription)")
                    exit(1)
                }
                if let timeZoneId = timeZoneId {
//                    print("Time Zone ID: \(timeZoneId)")
                    printCurrentTimeForTimeZone(timeZoneId: timeZoneId)
                } else {
                    print("Unable to retrieve time zone.")
                }
                
                exit(0)
            }
        }
    }
}

weatherAPI()
RunLoop.main.run()
