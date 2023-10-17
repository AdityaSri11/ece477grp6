import Foundation

func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
    print("made it to the fetchData function")
    URLSession.shared.dataTask(with: url) { data, response, error in
        completion(data, error)
    }.resume()
}

struct WeatherData: Codable {
  let weather: [Weather]
  let main: Main
  let dt: TimeInterval
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
}

func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    let fahrenheit = (kelvin - 273.15) * 9/5 + 32
    return fahrenheit
}

func convertUnixTimestampToDate(_ timestamp: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timestamp)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    dateFormatter.timeZone = TimeZone(identifier: "America/New_York") // Set the timezone to New York
    return dateFormatter.string(from: date)
}

func printWeatherInfo(city: String, temperature: Double, description: String) {
    let formattedTemperature = String(format: "%.2f", temperature)
    let weatherSymbol = mapDescriptionToSymbol(description)
    print("City: \(city)")
    print("Temperature: \(formattedTemperature)°F")
    print(description)
    print("Description: \(weatherSymbol)")
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

func main() {
  
//  let apiKey = ""
  let city = "West Lafayette"
  let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  let apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity!)&appid=\(apiKey)"

  
  print(apiUrl)
  
//  apiUrl = "https://jsonplaceholder.typicode.com/todos/1"
  
  if let url = URL(string: apiUrl) {
          fetchData(from: url) { data, error in
              if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    let temperatureKelvin = weatherData.main.temp
                    let temperature = kelvinToFahrenheit(temperatureKelvin)
                    let weatherDescription = weatherData.weather.first?.description ?? "Unknown"
                    printWeatherInfo(city: city, temperature: temperature, description: weatherDescription)
                  //                    let timestamp = weatherData.dt
//                    let time = convertUnixTimestampToDate(timestamp)
//                    print("Time of data retrieval: \(time)")
                } catch {
                    print("Error decoding JSON: \(error)")
                    exit(1) // Exit with an error code
                }
              } else if let error = error {
                  print("Error: \(error.localizedDescription)")
                  exit(1)
              }
            
            exit(0)
          }
      } else {
          print("Invalid API URL.")
          exit(1)
      }
}

main()
RunLoop.main.run()
