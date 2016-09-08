import XCTest
import Compass
@testable import AftermathCompass

class CompassCommandTests: XCTestCase {

  var command: CompassCommand!

  override func setUp() {
    super.setUp()
    Compass.scheme = "tests"
  }

  override func tearDown() {
    super.tearDown()
    Compass.routes.removeAll()
  }

  // MARK: - Tests

  func testInitWithURN() {
    let URN = "login"
    let payload = "Test"

    command = CompassCommand(URN: URN, payload: payload)

    XCTAssertEqual(command.URLString, "\(Compass.scheme)\(URN)")
    XCTAssertEqual(command.payload as? String, payload)
  }

  func testInitWithURL() {
    let URL = NSURL(string: "tests://callback?access_token=ya29")!
    let payload = "Test"

    command = CompassCommand(URL: URL, payload: payload)

    XCTAssertEqual(command.URLString, URL.absoluteString)
    XCTAssertEqual(command.payload as? String, payload)
  }
}