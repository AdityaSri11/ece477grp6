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
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.timeZone = TimeZone(identifier: "America/New_York") // Set the timezone to New York
    return dateFormatter.string(from: date)
}

func printWeatherInfo(city: String, temperature: Double, description: String) {
    let formattedTemperature = String(format: "%.2f", temperature)
    let weatherSymbol = mapDescriptionToSymbol(description)
    print("City: \(city)")
    print("Temperature: \(formattedTemperature)°F")
    print("Description: \(description)")
    print("Symbol: \(weatherSymbol)")
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

func addMinutesToTime(_ timeString: String, minutesToAdd: Int) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm" // Use a 24-hour time format

    if let initialDate = dateFormatter.date(from: timeString) {
        let calendar = Calendar.current
        if let updatedDate = calendar.date(byAdding: .minute, value: minutesToAdd, to: initialDate) {
            let updatedDateFormatter = DateFormatter()
            updatedDateFormatter.dateFormat = "HH:mm"
            return updatedDateFormatter.string(from: updatedDate)
        }
    }

    return nil // Return nil if there's an error in parsing or adding minutes
}

func weatherAPI() {
  
  let apiKey = "s"
  let city = "Tehran"
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
                    
                    let timestamp = weatherData.dt
                    let time = convertUnixTimestampToDate(timestamp)
                                      
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

weatherAPI()
RunLoop.main.run()
