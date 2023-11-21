//
//  WiFi.swift
//  SeniorDesign_v2
//
//  Created by Aditya Srikanth on 10/31/23.
//
import Foundation
import Network

let numberOfRows = 10
let numberOfColumns = 6
let initialValue = 0

var display = [[Int]](repeating: [Int](repeating: initialValue, count: numberOfColumns), count: numberOfRows)

class ESP8266Client {
    private let host: NWEndpoint.Host
    private let port: NWEndpoint.Port
    private var connection: NWConnection?

    init(host: String, port: UInt16) {
        self.host = NWEndpoint.Host(host)
        self.port = NWEndpoint.Port(rawValue: port)!
    }

    func connect() {
        let parameters = NWParameters.tcp
        connection = NWConnection(host: host, port: port, using: parameters)

        connection?.stateUpdateHandler = { state in
            print("State updated: \(state)")
            switch state {
            case .ready:
                print("Connected to ESP8266")
                self.sendDisplayToESP8266()
            case .failed(let error):
                print("Connection failed: \(error)")
            default:
                print("Unhandled state: \(state)")
            }
        }

        // Start the connection on the main queue
        connection?.start(queue: .main)
    }


    func sendDisplayToESP8266() {
        guard let connection = connection else {
            print("Connection is not established.")
            return
        }

        let maxChunkSize = 256  // Define your desired chunk size
        for row in display {
                let rowBytes = row.map { UInt8($0) }  // Convert Int values to UInt8

                // Split the rowBytes into chunks and send them
                for i in stride(from: 0, to: rowBytes.count, by: maxChunkSize) {
                    let endIndex = min(i + maxChunkSize, rowBytes.count)
                    let chunk = rowBytes[i..<endIndex]
//                    print(chunk)
                    let chunkData = Data(chunk)  // Convert the chunk to Data
                    connection.send(content: chunkData, completion: .idempotent)
                }
            }
    }
  
    func test_write_2(){
            let chartoSend: Character = "H";
            
            if let charData = String(chartoSend).data(using: .utf8) {
              
              connection?.send(content: charData, completion: .contentProcessed({ error in
                if let error = error {
                  print("Error sending data: \(error)")
                } else {
                  print("Character sent successfully")
                }
              }))
            }
    }

    func disconnect() {
        connection?.cancel()
    }
}

// Usage
func test_esp(){
  
  for _ in 0..<numberOfRows {
      var row = [Int]()
      for _ in 0..<numberOfColumns {
          row.append(0)
      }
      display.append(row)
  }
  
  let espClient = ESP8266Client(host: "192.168.0.102", port: 12345)
  espClient.connect()
  sleep(1);
  espClient.test_write_2();
  sleep(1);
}


func send_dataMap(_ sourceMatrix: [[Int]]) {
  display = sourceMatrix
  let espClient = ESP8266Client(host: "192.168.0.102", port: 12345)
  
  espClient.connect()
  espClient.sendDisplayToESP8266()
  espClient.disconnect()
}



