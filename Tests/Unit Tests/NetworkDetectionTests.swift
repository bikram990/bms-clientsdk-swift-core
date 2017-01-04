/*
 *     Copyright 2016 IBM Corp.
 *     Licensed under the Apache License, Version 2.0 (the "License");
 *     you may not use this file except in compliance with the License.
 *     You may obtain a copy of the License at
 *     http://www.apache.org/licenses/LICENSE-2.0
 *     Unless required by applicable law or agreed to in writing, software
 *     distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 */

import XCTest
@testable import BMSCore



// IMPORTANT: Unit tests are not adequate to ensure that the NetworkDetection class is behaving correctly. To fully exercise NetworkDetection, run the "TestApp iOS" target on a real iOS device.
class NetworkDetectionTests: XCTestCase {
    
    
    func testCellularNetworkType() {
        
        let networkDetector = NetworkDetection()
        XCTAssertNil(networkDetector?.cellularNetworkType)
    }
    
    
    func testCurrentNetworkConnection() {
        
        // Since unit tests run on a Mac, the internet connection must be either WiFi or no connection.
        let networkDetector = NetworkDetection()
        XCTAssert(networkDetector?.currentNetworkConnection != NetworkConnection.WWAN)
    }

    
    func testNetworkConnection() {
        
        XCTAssertEqual(NetworkConnection.noConnection.description, "No Connection")
        XCTAssertEqual(NetworkConnection.WWAN.description, "WWAN")
        XCTAssertEqual(NetworkConnection.WiFi.description, "WiFi")
    }
    
    
    func testStartMonitoringNetworkChanges() {
        
        let networkDetector = NetworkDetection()
        let _ = networkDetector!.startMonitoringNetworkChanges()
        
        XCTAssertTrue(networkDetector!.isMonitoringNetworkChanges)
        
        networkDetector!.stopMonitoringNetworkChanges()
        
        XCTAssertFalse(networkDetector!.isMonitoringNetworkChanges)
    }
    
}
