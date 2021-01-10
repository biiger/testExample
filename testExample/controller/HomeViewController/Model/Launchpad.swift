//
//  launchpad.swift
//  testExample
//
//  Created by SatangBiiger Jaydeestan on 10/1/2564 BE.
//

import Foundation
import JSONParserSwift

class Launchpad: ParsableModel {
    var name: String?
    var full_name: String?
    var locality: String?
    var region: String?
    var timezone: String?
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var launch_attempts: Int = 0
    var launch_successes: Int = 0
    var rockets: [String]?
    var launches: [String]?
    var details: String?
    var status: String?
}
