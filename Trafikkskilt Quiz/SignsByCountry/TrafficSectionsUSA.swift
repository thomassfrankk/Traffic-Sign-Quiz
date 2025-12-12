//
//  TrafficSectionsUSA.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 25/10/25.
//

//import Foundation
//
//struct TrafficSectionsUSA {
//    
//    static let regulatorySigns = TrafficSection(
//        name: "Regulatory Signs",
//        description: """
//Regulatory signs are used to inform road users of traffic laws and regulations that must be obeyed. They indicate actions that are required, prohibited, or restricted in order to ensure safe and orderly traffic flow. Failure to comply with these signs constitutes a traffic violation and may result in fines or penalties.
//""",
//        subSections: [
//            TrafficSubSection(
//                index: 0,
//                name: "Lane Control",
//                description: "Includes stop and yield signs, lane usage, turn restrictions, reversible lanes, and lane-specific movement controls to guide drivers safely through intersections and merges.",
//                signs: [
//                    TrafficSign(
//                        title: "Stop",
//                        description: "Requires drivers to make a complete stop at the stop line, crosswalk, or before entering the intersection. Used to assign right-of-way where needed for safety.",
//                        images: ["R1-1"],
//                        wrongAnswers: ["Yield", "Do Not Enter", "No Stopping", "Speed Limit", "One Way", "Merge", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Yield",
//                        description: "Instructs drivers to give the right-of-way to other vehicles and pedestrians. Drivers must slow down or stop if necessary before proceeding safely.",
//                        images: ["R1-2"],
//                        wrongAnswers: ["Stop", "Do Not Enter", "Merge", "One Way", "No Passing Zone", "Speed Limit", "Right Lane Ends"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Yield/Stop Plaques",
//                        description: "Supplemental plaques used with Stop or Yield signs to clarify right-of-way conditions and traffic flow. Includes versions indicating oncoming traffic, traffic in a circle, all lanes, or exceptions for right turns.",
//                        images: ["R1-2aP", "R1-2bP", "R1-2cP", "R1-10P"],
//                        wrongAnswers: ["No Turn On Red", "Keep Right", "Speed Limit", "One Way", "Do Not Enter", "Merge", "Right Lane Ends", "Right Turn Only", "No Right Turn"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "All-Way Stop",
//                        description: "Indicates that all approaches at an intersection are controlled by stop signs. Covers 2-way, 3-way, and 4-way stop intersections, helping clarify which drivers must stop and proceed in order of arrival. Also called 'All-Way Stop' in the MUTCD.",
//                        images: ["R1-3P", "R1-3P-3Way", "R1-3P-4Way"],
//                        wrongAnswers: ["Yield to Right", "Roundabout Ahead", "One Way", "No Stopping", "Do Not Enter", "Speed Limit", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Yield Here to Pedestrians",
//                        description: "Instructs drivers to yield to pedestrians at the designated crosswalk ahead. Used at midblock crossings and intersections without traffic signals. Previously designated under an older MUTCD format.",
//                        images: ["R1-5L", "R1-5R"],
//                        wrongAnswers: ["Stop Ahead", "Stop Here for Pedestrians", "Yield Here to Trail Crossing", "One Way", "Stop Here to Trail Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Stop Here for Pedestrians",
//                        description: "Requires drivers to stop at the indicated line to allow pedestrians to cross safely at marked crosswalks. Commonly used at unsignalized midblock crossings and intersections with high pedestrian activity.",
//                        images: ["R1-5bL", "R1-5bR"],
//                        wrongAnswers: ["Yield Here for Pedestrians", "Yield Here to Trail Crossing", "One Way", "Stop Here to Trail Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Yield Here to Trail Crossing",
//                        description: "Placed where roadways intersect designated trails or paths, requiring drivers to yield to trail users before proceeding.",
//                        images: ["R1-5dL", "R1-5dR"],
//                        wrongAnswers: ["Bike Lane", "Trail Ahead", "Stop Here for Pedestrians",  "Yield Here to Pedestrians", "One Way", "Stop Here to Trail Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Stop Here to Trail Crossing",
//                        description: "Placed where roadways intersect designated trails or paths, requiring drivers to stop completely for trail users before proceeding.",
//                        images: ["R1-5eL", "R1-5eR"],
//                        wrongAnswers: ["Bike Lane", "Trail Ahead", "Stop Here for Pedestrians",  "Yield Here to Pedestrians", "One Way", "Yield Here to Trail Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "In-Street Crossing",
//                        description: "Placed in the roadway at crosswalks to remind drivers to yield or stop for pedestrians and trail users. Used at unsignalized crossings, high pedestrian traffic areas, and trail intersections to improve safety.",
//                        images: ["R1-6", "R1-6v2", "R1-6a", "R1-6av2", "R1-6d", "R1-6e"],
//                        wrongAnswers: ["Do Not Enter", "No U-Turn", "Keep Right", "Speed Limit", "One Way", "Merge", "Right Lane Ends"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Overhead Pedestrian Crossing",
//                        description: "Mounted overhead to indicate crosswalks where pedestrians have the right of way, including school crossings. Used at locations where visibility, traffic speed, or pedestrian volume requires added emphasis for safety.",
//                        images: ["R1-9", "R1-9v2", "R1-9a", "R1-9av2", "R1-9c"],
//                        wrongAnswers: ["Do Not Enter", "No U-Turn", "Keep Right", "Speed Limit", "One Way", "Merge", "Right Lane Ends"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Turn Prohibition",
//                        description: "Prohibits turning movements at intersections. Variants restrict right turns only, left turns only, all turns, or specific vehicle classes. May include exceptions and part-time restrictions.",
//                        images: ["R3-1", "R3-1a", "R3-1b", "R3-1c", "R3-1d", "R3-1e", "R3-1f", "R3-1g", "R3-1h", "R3-1hv2", "R3-2", "R3-2a", "R3-3"],
//                        wrongAnswers: ["Right Lane Must Exit", "Lane for Left Turn Only", "Lane for U Turn Only", "HOV Lane Ahead", "HOV Lane Operation", "All Turns Directional", "Yield", "Stop"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "U-Turn Prohibition",
//                        description: "Prohibits U-turns at intersections. Variants restrict U-turns only or restrict both left turns and U-turns where those movements would interfere with traffic flow or create safety hazards.",
//                        images: ["R3-4", "R3-18"],
//                        wrongAnswers: ["No Right Turn", "Lane for U Turn Only", "All Turns from Right Lane", "Yield"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Mandatory Movement Lane Control",
//                        description: "Indicates movements that are required from specific lanes, such as left turn only, right turn only, or through only. Supplemental plaques may specify lane types such as bus, taxi, HOV, or bike lanes.",
//                        images: ["R3-5L", "R3-5R", "R3-5a", "R3-5bP", "R3-5cP", "R3-5dP", "R3-5fP", "R3-5gP", "R3-5hP"],
//                        wrongAnswers: ["No Right Turn", "Advance Intersection Lane Control", "Lane for U Turn Only", "Yield", "Stop", "HOV Lane Ahead"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Optional Movement Lane Control",
//                        description: "Indicates lanes where drivers may proceed straight or turn, combining through and turning movements. Includes configurations for right, left, or U-turns, and double-turn lanes.",
//                        images: ["R3-6L", "R3-6R", "R3-6a", "R3-6b"],
//                        wrongAnswers: ["No Left Turn", "Advance Intersection Lane Control", "Lane for U Turn Only", "Yield", "Stop", "Bike Lane"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    //                    TrafficSign(
//                    //                        title: "Lane for Turn / U Turn Only",
//                    //                        description: "Designates lanes for left turns, U-turns, or combined U and left turns.",
//                    //                        images: ["R3-19", "R3-19a", "R3-19b", "R3-26", "R3-26a"],
//                    //                        wrongAnswers: ["No Turns", "No Right Turn", "Through Only Lane", "Advance Intersection Lane Control", "Yield", "Stop", "HOV Lane Ahead"],
//                    //                        sectionName: "Regulatory Signs",
//                    //                        subSectionName: "Lane Control"
//                    //                    ),
//                    
//                    TrafficSign(
//                        title: "Lane Requirement",
//                        description: "Specifies mandatory lane actions for drivers. Variants indicate that a lane must turn (right or left) or must exit (right or left).",
//                        images: ["R3-7L", "R3-7R", "R3-33L", "R3-33R", "R3-33aL", "R3-33aR"],
//                        wrongAnswers: ["Turn Requirement", "Intersection Information", "Movement Restriction Sign", "Priority Information Sign", "Access Requirement Sign"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Advance Intersection Lane Control",
//                        description: "Advises drivers of lane usage approaching intersections. Covers 2-3 lanes, bike lanes, and circular intersections.",
//                        images: ["R3-8L", "R3-8R", "R3-8aL", "R3-8aR", "R3-8b", "R3-8xa", "R3-8xb", "R3-8xc", "R3-8zd", "R3-8ze", "R3-8zf", "R3-8zg"],
//                        wrongAnswers: ["Turn Only Lane Control", "No Turns", "Preferential Lane Ahead", "Right Lane Must Exit", "Yield", "Stop", "HOV Lane Operation"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Two-Way Left Turn Only",
//                        description: "Indicates a lane designated for left turns in both directions. Drivers may only use this lane for left turns and must yield to oncoming traffic if applicable.",
//                        images: ["R3-9a", "R3-9b"],
//                        wrongAnswers: ["Do Not Enter", "Stop Ahead", "Pedestrian Crossing", "School Zone", "Lane Ends", "Keep Right", "No Passing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Reversible Lane Control",
//                        description: "Indicates a lane where the direction of travel can change depending on time of day or traffic conditions. May be overhead or post-mounted.",
//                        images: ["R3-9e", "R3-9f"],
//                        wrongAnswers: ["One Way", "No Right Turn", "Roundabout Ahead", "Yield Ahead", "Bus Lane", "Bike Lane", "Do Not Enter"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Reversible Lane Control Transition",
//                        description: "Warns drivers of upcoming reversible lanes and indicates where they end. Prepares drivers for changes in lane direction or usage, with traffic returning to normal lane direction rules beyond the end point.",
//                        images: ["R3-9g", "R3-9h", "R3-9i"],
//                        wrongAnswers: ["One Way", "Lane Shift", "Merge Left", "No Right Turn", "Stop Ahead", "Keep Left"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "HOV Lane Operation",
//                        description: "Signs defining high-occupancy vehicle lanes, occupancy rules, and restrictions for 2+ person vehicles. Includes post-mounted variants with time-based and full-time restrictions.",
//                        images: ["R3-10", "R3-10a", "R3-11", "R3-11a", "R3-11b", "R3-11c", "R3-12", "R3-12a", "R3-12b", "R3-12c", "R3-12d", "R3-12e", "R3-13", "R3-13a", "R3-14", "R3-14a", "R3-14b", ],
//                        wrongAnswers: ["No Right Turn", "No Left Turn", "Lane for Turn Only", "Reversible Lane Control", "Yield", "Stop", "Bike Lane"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bus Lane Operation",
//                        description: "Signs defining bus lanes, taxi lanes, and restrictions for buses and public transit vehicles. Includes operational signs and advance warnings for lane start and end points.",
//                        images: ["R3-11d", "R3-11e", "R3-11f", "R3-11g", "R3-12f", "R3-12g", "R3-12h", "R3-15d", "R3-15e", "R3-14c"],
//                        wrongAnswers: ["No Right Turn", "No Left Turn", "Lane for Turn Only", "Yield", "Stop", "Bike Lane", "Express Lane"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bicycle Lane Designation",
//                        description: "Designates lanes for bicycles.",
//                        images: ["R3-17"],
//                        wrongAnswers: ["Shared Use Path", "Bicycle Crossing", "Bicycle Lane Ends", "Pedestrian Lane Designation", "Yield to Bicycles"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    
//                    
//                    // Lane-Specific Turn Signs
//                    TrafficSign(
//                        title: "Lane-Specific Turn Movements",
//                        description: "Designates lanes where drivers may make specific turns: left only, U-turn only, or U-turn and left. Used to clearly indicate permitted movements in each lane at intersections.",
//                        images: ["R3-19", "R3-19a", "R3-19b"],
//                        wrongAnswers: ["Through Only", "All Turns", "No Straight Through", "Bike Lane", "Yield", "Stop", "Do Not Enter"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    // Begin Turn Lane Signs
//                    TrafficSign(
//                        title: "Begin Turn Lane",
//                        description: "Indicates where a dedicated turn lane begins, either for right or left turns. Helps drivers merge into the correct lane before the intersection.",
//                        images: ["R3-20R", "R3-20L"],
//                        wrongAnswers: ["Lane for U Turn Only", "All Turns", "Through Only", "Bike Lane", "Yield", "Stop", "No Straight Through"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    // Jug Handle / Directional Signs (Diagonal, Right, Straight Arrows)
//                    TrafficSign(
//                        title: "Jug-Handle Lane Movements",
//                        description: "Indicates permitted movements from lanes at jug-handle intersections. Covers all turns, U-turn only, U+left turns, and variations using diagonal, right, or straight arrows, including movements from the right lane.",
//                        images: ["R3-23", "R3-23a", "R3-24", "R3-24a", "R3-24b", "R3-25", "R3-25a", "R3-25b", "R3-26", "R3-26a"],
//                        wrongAnswers: ["Through Only", "Bike Lane", "Yield", "Stop", "No Straight Through", "Right Lane Must Exit", "Do Not Enter"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    // Prohibition Sign
//                    TrafficSign(
//                        title: "No Straight Through",
//                        description: "Indicates that vehicles in the lane may not continue straight through the intersection.",
//                        images: ["R3-27"],
//                        wrongAnswers: [
//                            "No Left Turn Only",
//                            "No Right Turn Only",
//                            "No U-Turn Only",
//                            "No All Turns",
//                            "No Yield",
//                            "No Stop",
//                            "No Bike Lane"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Toll Lane",
//                        description: "Signs indicating toll or priced lanes and their start or end points. Shows lane designation and management instructions for toll roads.",
//                        images: ["R3-28", "R3-29P", "R3-31", "R3-44", "R3-44a", "R3-48", "R3-48a"],
//                        wrongAnswers: ["No Right Turn", "No Left Turn", "Lane for Turn Only", "Advance Intersection Lane Control", "Yield", "Stop", "Bike Lane"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Shoulder Travel Control",
//                        description: "Signs indicating part-time shoulder travel permissions and restrictions. Includes signs for when drivers may use the shoulder during certain times or conditions, and where shoulder travel sections begin and end.",
//                        images: ["R3-51", "R3-51d", "R3-51e", "R3-52", "R3-52a", "R3-52b", "R3-52c"],
//                        wrongAnswers: ["Emergency Stopping Only", "No Trucks on Shoulder", "No Buses or Trucks", "No Shoulder Use", "Shoulder Parking Only", "No Shoulder Stopping", "Right Shoulder Use"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Passing Control",
//                        description: "Signs regulating passing and overtaking on roadways. Includes prohibitions on passing, permission to pass with caution, and guidance for slower traffic to keep right.",
//                        images: ["R4-1", "R4-2", "R4-3"],
//                        wrongAnswers: ["Keep Right", "Keep Left", "Lane Shift", "Merge Ahead", "Stop", "Yield", "Do Not Drive on Shoulder"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Lane-Assisted Guidance",
//                        description: "Covers lane-specific instructions including turn lanes, lane for trucks, keeping right or left, staying in lane, and exceptions for bicycles or obstacles.",
//                        images: [
//                            "R4-7", "R4-7a", "R4-7b",
//                            "R4-8", "R4-8a", "R4-8b",
//                            "R4-9", "R4-9a",
//                            "R4-4", "R4-5",
//                        ],
//                        wrongAnswers: ["Do Not Pass", "Pass With Care", "Slower Traffic Keep Right", "Yield", "Stop", "Bicycle Passing Clearance", "Runaway Vehicles Only"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    TrafficSign(
//                        title: "Runaway Vehicle Controls",
//                        description: "Signs for runaway vehicles requiring turnouts.",
//                        images: ["R4-10"],
//                        wrongAnswers: ["Do Not Pass", "Pass With Care", "Keep Right", "Keep Left", "Yield", "Stop", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Slow Vehicle Controls",
//                        description: "Signs for slow vehicles requiring turnouts.",
//                        images: ["R4-12", "R4-13", "R4-14"],
//                        wrongAnswers: ["Do Not Pass", "Pass With Care", "Keep Right", "Keep Left", "Yield", "Stop", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Shoulder Use Restrictions",
//                        description: "Signs prohibiting driving or passing on the shoulder except in emergencies or where otherwise indicated.",
//                        images: ["R4-17", "R4-18"],
//                        wrongAnswers: ["Emergency Stopping Only", "No Trucks on Shoulder", "Travel on Shoulder Allowed", "Shoulder Parking Only", "No Shoulder Use", "Shoulder Exit Lane", "Right Shoulder Use"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bicycle Passing Clearance",
//                        description: "Advises drivers on safe lateral clearance when overtaking bicycles.",
//                        images: ["R4-19"],
//                        wrongAnswers: ["Bicycle Path Ahead", "Shared Use Path", "Bicycle Crossing", "Pedestrian Crossing", "Yield to Bicycles", "Bicycles Prohibited", "Bicycles Lane Designation"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Turn Requirement",
//                        description: "Signs indicating that all traffic or vehicles in a specific lane must turn in the direction shown (right or left).",
//                        images: ["R4-20R", "R4-20L", "R4-21R", "R4-21L"],
//                        wrongAnswers: ["No U-Turn", "All Turns Prohibited", "Straight Only", "Pass With Care", "Do Not Pass", "Yield", "Stop"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Lane Control"
//                    ),
//                ]
//            ),
//            TrafficSubSection(
//                index: 1,
//                name: "Speed & Parking",
//                description: "Covers maximum and minimum speed limits for various vehicles and zones, as well as parking, stopping, and loading regulations to ensure safe and efficient traffic flow.",
//                signs: [
//                    TrafficSign(
//                        title: "Speed Limit",
//                        description: "Indicates the maximum speed allowed for all vehicles and specific vehicle types (trucks, buses, vehicles over a specified weight, and during nighttime).",
//                        images: ["R2-1", "R2-2P", "R2-2aP", "R2-2bP", "R2-2cP", "R2-3P"],
//                        wrongAnswers: [
//                            "Minimum Speed Limit", "End Work Zone Speed Limit", "Citywide", "Fines Double",
//                            "Truck Speed Limit", "Yield", "Stop", "Bus Speed Limit", "Fines Higher",
//                            "End Higher Fines Zone", "Residential", "Night Speed Limit", "End Variable Speed Limit",
//                            "Daytime Speed Limit"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Minimum Speed Limit",
//                        description: "Indicates the minimum speed vehicles must maintain. Helps prevent traffic slowdowns on high-speed roads.",
//                        images: ["R2-4P"],
//                        wrongAnswers: ["Maximum Speed Limit", "Truck Speed Limit", "Bus Speed Limit", "Yield", "Stop", "Fines Double", "Citywide"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Combined Maximum and Minimum Speed Limits",
//                        description: "Displays both the maximum and minimum speeds for a section of roadway, helping maintain safe and efficient traffic flow.",
//                        images: ["R2-4a"],
//                        wrongAnswers: ["Truck-Bus Speed Limit", "Yield", "Stop", "Citywide", "Fines Higher", "Night Speed Limit", "End Work Zone Speed Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Main Speed Limit Applies",
//                        description: "Indicates that the main speed limit applies unless a different limit is posted in a specific area.",
//                        images: ["R2-5P"],
//                        wrongAnswers: ["Citywide", "Residential", "Fines Higher", "Yield", "Stop", "Truck Speed Limit", "Night Speed Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Area-Specific Speed Limit",
//                        description: "Indicates the maximum speed allowed in specific types of areas, such as citywide, neighborhood, or residential zones, to regulate traffic and ensure safety.",
//                        images: ["R2-5aP", "R2-5bP", "R2-5cP"],
//                        wrongAnswers: [
//                            "Minimum Speed Limit", "Yield", "Stop", "Fines Double", "Fines Higher",
//                            "Truck Speed Limit", "Truck-Bus Speed Limit", "End Variable Speed Limit"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Speeding Fines",
//                        description: "Indicates that fines for speeding in this zone may be higher than normal, doubled, or a specific amount is enforced to regulate traffic and encourage safe driving.",
//                        images: ["R2-6P", "R2-6aP", "R2-6bP"],
//                        wrongAnswers: [
//                            "Speed Limit", "Yield", "Stop", "Minimum Speed Limit",
//                            "Truck Speed Limit", "Truck-Bus Speed Limit", "Residential",
//                            "Citywide", "Night Speed Limit"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Higher Fines Zone",
//                        description: "Indicates the start or end of a zone where fines for traffic violations are higher than normal, helping drivers recognize areas with stricter enforcement.",
//                        images: ["R2-10", "R2-11"],
//                        wrongAnswers: [
//                            "Yield", "Stop", "Minimum Speed Limit", "Truck Speed Limit",
//                            "Truck-Bus Speed Limit", "Citywide", "Residential", "Night Speed Limit"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "End of Special Speed Limit",
//                        description: "Indicates the end of a roadway section where special speed limits apply, including variable limits or truck-specific limits, with normal speed regulations resuming beyond this point.",
//                        images: ["R2-13", "R2-14"],
//                        wrongAnswers: [
//                            "Truck Speed Limit", "Bus Speed Limit", "Yield", "Stop",
//                            "Citywide", "Residential", "Fines Double", "Fines Higher", "Minimum Speed Limit"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "No Parking",
//                        description: "Indicates areas where parking is prohibited. Variants specify conditions such as location, surface, or exceptions.",
//                        images: ["R7-1", "R8-1", "R8-2", "R8-3", "R8-3a", "R8-3c", "R8-3d", "R8-3e", "R8-3f"],
//                        wrongAnswers: ["No Standing", "No Stopping", "One Hour Parking", "Two Hour Parking", "Reserved Parking", "Tow Away Zone", "Metered Parking"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Time-Restricted Parking",
//                        description: "Indicates areas where parking is restricted by time, including specific hours or exceptions such as Sundays and holidays.",
//                        images: ["R7-2", "R7-2a", "R7-3"],
//                        wrongAnswers: [
//                            "No Parking Any Time", "One Hour Parking", "No Standing",
//                            "Reserved Parking", "Tow Away Zone", "Metered Parking", "No Stopping"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "No Standing Any Time",
//                        description: "Indicates areas where vehicles may not remain stationary at any time, except briefly to load or unload passengers if permitted.",
//                        images: ["R7-4"],
//                        wrongAnswers: ["No Parking Any Time", "One Hour Parking", "Reserved Parking", "Tow Away Zone", "Metered Parking", "No Parking (Times)", "No Stopping Any Time"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "No Stopping Any Time",
//                        description: "Indicates areas where vehicles may not stop for any reason at any time.",
//                        images: ["R7-4a"],
//                        wrongAnswers: ["No Parking Any Time", "One Hour Parking", "Reserved Parking", "Tow Away Zone", "Metered Parking", "No Parking (Times)", "No Standing Any Time"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Parking Fee Station",
//                        description: "Indicates that payment for parking must be made at a nearby fee station rather than at individual parking meters.",
//                        images: ["R7-20"],
//                        wrongAnswers: ["Two Hour Parking", "Reserved Parking", "Tow Away Zone", "No Parking Any Time", "Electric Vehicle Charging Only", "Loading Zone"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Time-Limited Parking",
//                        description: "Specifies areas with parking limits, such as one hour or two hour parking, including metered areas.",
//                        images: ["R7-5", "R7-21", "R7-22", "R7-108", "R7-112", "R7-112a", "R7-112b", "R7-114", "R7-114a", "R7-114b"],
//                        wrongAnswers: ["No Parking Any Time", "No Standing", "No Stopping", "Reserved Parking", "Tow Away Zone", "Electric Vehicle Only Parking", "Snow Emergency Zone"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Designated Parking",
//                        description: "Indicates parking spaces reserved for vehicles displaying a wheelchair placard or license plate.",
//                        images: ["R7-8"],
//                        wrongAnswers: ["No Standing", "No Stopping", "One Hour Parking", "Two Hour Parking", "Metered Parking", "Loading Zone"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Reverse Parking Only",
//                        description: "Indicates that vehicles must back into the parking space rather than pull in forward.",
//                        images: ["R7-10"],
//                        wrongAnswers: ["No Standing", "No Stopping", "Loading Zone", "Reserved Parking", "Metered Parking", "One Hour Parking"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    // 1️⃣ No Parking Except Electric Vehicles / Charging Only
//                    TrafficSign(
//                        title: "No Parking Except Electric Vehicles / Charging Only",
//                        description: "Indicates parking allowed only for electric vehicles or only while charging, without additional time restrictions.",
//                        images: ["R7-111", "R7-111a", "R7-113"],
//                        wrongAnswers: ["No Standing", "No Stopping", "Reserved Parking", "Tow Away Zone"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    // 2️⃣ Electric Vehicles / Charging Only – Time Restricted
//                    TrafficSign(
//                        title: "Time Restricted Electric Vehicle / Charging Only",
//                        description: "Indicates parking allowed only for electric vehicles or only while charging, with specific time restrictions.",
//                        images: ["R7-112", "R7-112a", "R7-112b", "R7-114", "R7-114a", "R7-114b"],
//                        wrongAnswers: ["No Standing", "No Stopping", "Reserved Parking", "Tow Away Zone"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "No Parking Zones",
//                        description: "Indicates areas where parking is prohibited, including spaces reserved for loading, bike lanes, or bus stops, to ensure traffic flow and safety.",
//                        images: ["R7-6", "R7-9", "R7-9a", "R7-107", "R7-107a", "R7-107b"],
//                        wrongAnswers: [
//                            "No Standing", "No Stopping", "One Hour Parking", "Two Hour Parking",
//                            "Metered Parking", "Reserved Parking", "Loading Zone",
//                            "Electric Vehicle Only Parking", "Tow Away Zone"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Tow Away Zone",
//                        description: "Indicates areas where vehicles may be towed if parked.",
//                        images: ["R7-201P", "R7-201aP"],
//                        wrongAnswers: ["No Standing", "No Stopping", "One Hour Parking", "Two Hour Parking", "Reserved Parking", "Metered Parking"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Combined No Parking / Limited Parking",
//                        description: "Indicates areas with mixed parking restrictions — no parking during specified times, and limited-time parking (e.g., one hour) during others.",
//                        images: ["R7-200", "R7-200a"],
//                        wrongAnswers: ["One Hour Parking", "Reserved Parking", "Tow Away Zone", "Electric Vehicle Only Parking", "Snow Emergency Zone"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Emergency Snow Route",
//                        description: "Indicates a designated snow emergency route where parking is prohibited during declared snow emergencies. Vehicles parked during these periods will be towed.",
//                        images: ["R7-203"],
//                        wrongAnswers: ["Time-Limited Parking", "No Standing", "Reserved Parking", "Electric Vehicle Only Parking", "Combined No Parking / Limited Parking", "Parking Fee Station"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    TrafficSign(
//                        title: "Restricted Stopping Areas",
//                        description: "Indicates areas where stopping is either prohibited or allowed only in designated locations, such as shoulders or marked stopping zones.",
//                        images: ["R8-5", "R8-6"],
//                        wrongAnswers: [
//                            "Emergency Parking Only", "No Parking", "Reserved Parking",
//                            "One Hour Parking", "Two Hour Parking", "Do Not Pass", "Keep Right"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Only",
//                        description: "Indicates areas where stopping or parking is allowed only in emergency situations.",
//                        images: ["R8-4", "R8-7"],
//                        wrongAnswers: [
//                            "No Stopping", "No Parking", "Reserved Parking",
//                            "One Hour Parking", "Two Hour Parking", "Do Not Pass", "Keep Right"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Railroad Track Rules",
//                        description: "Indicates areas with railroad tracks where stopping may be prohibited or where tracks are out of service and can be crossed safely.",
//                        images: ["R8-8", "R8-9"],
//                        wrongAnswers: [
//                            "Emergency Stopping Only", "No Parking", "Reserved Parking",
//                            "One Hour Parking", "Do Not Pass", "Keep Right"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Stop Here When Flashing",
//                        description: "Drivers must stop at the line when the lights are flashing. Includes alternate versions of the same sign.",
//                        images: ["R8-10", "R8-10a"],
//                        wrongAnswers: ["Do Not Stop on Tracks", "Emergency Stopping Only", "No Parking", "No Stopping", "Reserved Parking", "Do Not Pass", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Speed & Parking"
//                    )
//                ]
//            ),
//            TrafficSubSection(
//                index: 2,
//                name: "Access & Restrictions",
//                description: "Restricts or prohibits entry for certain vehicles, pedestrians, or general traffic, and covers one-way streets, divided highway controls, and access regulations to maintain safety and order.",
//                signs: [
//                    TrafficSign(
//                        title: "Do Not Enter",
//                        description: "Indicates that entry to the roadway or area is prohibited for all vehicles.",
//                        images: ["R5-1"],
//                        wrongAnswers: ["Wrong Way", "No Trucks", "Keep Right", "Yield", "Stop", "No Pedestrians", "Do Not Pass"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Wrong Way",
//                        description: "Indicates that traveling in the shown direction is prohibited, either for all vehicles or specifically for bicycles.",
//                        images: ["R5-1a", "R5-1b"],
//                        wrongAnswers: [
//                            "Do Not Enter", "No Trucks", "Keep Right",
//                            "Yield", "Stop", "No Pedestrians", "Do Not Pass"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "No Trucks",
//                        description: "Prohibits trucks from entering the roadway, unless otherwise specified.",
//                        images: ["R5-2"],
//                        wrongAnswers: ["No Thru Trucks", "No Motorized Vehicles", "Do Not Enter", "Keep Right", "Yield", "Stop", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Restricted Access",
//                        description: "Indicates areas where entry is prohibited for certain users or vehicles, including local delivery, trucks, commercial vehicles, motorized vehicles, vehicles with lugged wheels, bicycles, pedestrians, motor-driven cycles, unauthorized vehicles, or through traffic.",
//                        images: [
//                            "R5-2aP",
//                            "R5-2b", "R5-3", "R5-4", "R5-5",
//                            "R5-6", "R5-7", "R5-8", "R5-10", "R5-10a", "R5-10b", "R5-10c",
//                            "R5-11", "R5-12"
//                        ],
//                        wrongAnswers: [
//                            "Do Not Enter", "Keep Right",
//                            "Yield", "Stop", "Lane-Assisted Guidance", "No Pedestrians"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "One Way",
//                        description: "Indicates a one-way street in the direction shown (right or left).",
//                        images: ["R6-1R", "R6-1L", "R6-2R", "R6-2L"],
//                        wrongAnswers: ["Divided Highway Crossing", "Begin One Way", "End One Way", "Roundabout Circulation", "Yield", "Stop", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Divided Highway Crossing",
//                        description: "Indicates a divided highway ahead. Includes T-intersection variant.",
//                        images: ["R6-3", "R6-3a"],
//                        wrongAnswers: ["One Way", "Begin One Way", "End One Way", "Roundabout Circulation", "Yield", "Stop", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "One-Way Street Sign",
//                        description: "Indicates the start or end of a one-way street.",
//                        images: ["R6-6", "R6-7"],
//                        wrongAnswers: ["Divided Highway Crossing", "Roundabout Circulation", "Yield", "Stop", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Roundabout Circulation",
//                        description: "Provides direction for traffic circulation within a roundabout.",
//                        images: ["R6-5P"],
//                        wrongAnswers: ["One Way", "Divided Highway Crossing", "Begin One Way", "End One Way", "Yield", "Stop", "Keep Right"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Median Restriction",
//                        description: "Instructs drivers to stay off medians, dividers, or raised areas in the roadway.",
//                        images: ["R11-1"],
//                        wrongAnswers: ["Road Closed", "Bridge Out", "Path Closed", "Street Closed", "Do Not Enter", "No Parking", "Yield"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Access Closed",
//                        description: "Indicates that a roadway, street, bridge, or pedestrian/bike path is closed to traffic. May include distance markers or local traffic exemptions.",
//                        images: ["R11-2", "R11-3", "R11-4", "R11-2a", "R11-3a", "R11-2b", "R11-3b", "R11-2c"],
//                        wrongAnswers: [
//                            "Keep Off Median", "No Parking", "Lane Restriction", "Yield", "Stop", "Height Limit"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Weight Limit",
//                        description: "Specifies the maximum weight allowed for vehicles or trucks on the roadway, including axle and gross weight limits and restrictions for special hauling vehicles.",
//                        images: ["R12-1", "R12-2", "R12-4", "R12-5", "R12-6"],
//                        wrongAnswers: ["Height Limit", "No Trucks", "Lane Restriction", "Speed Limit", "Yield", "Stop", "Do Not Enter"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Vehicle Weight Limit",
//                        description: "Indicates special weight limits applicable to emergency vehicles only.",
//                        images: ["R12-7", "R12-7aP"],
//                        wrongAnswers: ["Weight Limit", "Axle Weight Limit", "Gross Vehicle Limit", "Truck Symbols", "Special Hauling Vehicles", "Do Not Enter", "Yield"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Weigh Station Entry",
//                        description: "Directs trucks exceeding a specified weight to enter the next weigh station.",
//                        images: ["R13-1"],
//                        wrongAnswers: ["Weight Limit Signs", "Height Limit Signs", "Lane Restriction", "Stop Here", "Do Not Enter", "Yield", "Emergency Vehicle Weight Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    TrafficSign(
//                        title: "Designated Truck Route",
//                        description: "Designates roads specifically intended for trucks to follow, ensuring proper routing and compliance with regulations.",
//                        images: ["R14-1"],
//                        wrongAnswers: ["Hazardous Material Route", "National Network Route", "Do Not Enter", "Weight Limit", "Height Limit", "No Trucks"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Hazardous Material Route",
//                        description: "Specifies roads that may be used by vehicles carrying hazardous materials.",
//                        images: ["R14-2"],
//                        wrongAnswers: ["Truck Route", "National Network Route", "Hazardous Material Prohibited", "Do Not Enter", "Weight Limit", "Height Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Hazardous Material Prohibited",
//                        description: "Indicates roads where vehicles carrying hazardous materials are not allowed.",
//                        images: ["R14-3"],
//                        wrongAnswers: ["Truck Route", "Hazardous Material Route", "National Network Route", "Do Not Enter", "Weight Limit", "Height Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "National Network Route",
//                        description: "Designates roads that are part of the national highway network intended for commercial vehicles.",
//                        images: ["R14-4"],
//                        wrongAnswers: ["Truck Route", "Hazardous Material Route", "National Network Prohibited", "Do Not Enter", "Weight Limit", "Height Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "National Network Prohibited",
//                        description: "Indicates roads that are not part of the national highway network and are restricted for certain commercial vehicles.",
//                        images: ["R14-5"],
//                        wrongAnswers: ["Truck Route", "Hazardous Material Route", "National Network Route", "Do Not Enter", "Weight Limit", "Height Limit"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    // MARK: - Railroad Crossings
//                    TrafficSign(
//                        title: "Railroad Crossing",
//                        description: "Indicates the presence of a railroad crossing. Includes crossbuck signs and associated plaques.",
//                        images: ["R15-1"],
//                        wrongAnswers: ["Do Not Pass Stopped Trains", "Do Not Drive on Tracks", "Look Both Ways", "Light Rail Only", "Number of Tracks", "Divided Highway Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Light Rail Only Lane",
//                        description: "Indicates lanes reserved for light rail vehicles, specifying lane position (right, left, or center).",
//                        images: ["R15-4a", "R15-4b", "R15-4c"],
//                        wrongAnswers: ["Railroad Crossing", "Do Not Pass Stopped Trains", "Do Not Drive on Tracks", "Look Both Ways", "Divided Highway Crossing", "Number of Tracks"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Do Not Pass Stopped Trains",
//                        description: "Prohibits passing trains that are stopped at crossings for safety reasons.",
//                        images: ["R15-5", "R15-5a"],
//                        wrongAnswers: ["Railroad Crossing", "Do Not Drive on Tracks", "Look Both Ways", "Light Rail Only", "Number of Tracks", "Divided Highway Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Do Not Drive on Tracks",
//                        description: "Prohibits driving along or on railway tracks, including light rail tracks.",
//                        images: ["R15-6", "R15-6a"],
//                        wrongAnswers: ["Railroad Crossing", "Do Not Pass Stopped Trains", "Look Both Ways", "Light Rail Only", "Number of Tracks", "Divided Highway Crossing"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Divided Highway Transit Rail Crossing",
//                        description: "Indicates a transit rail crossing across a divided highway; includes T-intersection variant.",
//                        images: ["R15-7", "R15-7a"],
//                        wrongAnswers: ["Railroad Crossing", "Do Not Pass Stopped Trains", "Do Not Drive on Tracks", "Look Both Ways", "Light Rail Only", "Number of Tracks"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Look Both Ways",
//                        description: "Advises drivers and pedestrians to look in both directions before crossing railroad tracks.",
//                        images: ["R15-8"],
//                        wrongAnswers: ["Railroad Crossing", "Do Not Pass Stopped Trains", "Do Not Drive on Tracks", "Light Rail Only", "Divided Highway Crossing", "Number of Tracks"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    // MARK: - Vehicle and Shoulder Safety
//                    TrafficSign(
//                        title: "Move Over / Reduce Speed",
//                        description: "Instructs drivers to move over or reduce speed for vehicles stopped on the shoulder or in minor crash situations.",
//                        images: ["R16-3", "R16-4"],
//                        wrongAnswers: ["Lights On When Using Wipers", "Lights On When Raining", "Check Headlights", "No Hand-Held Phone Use", "Blasting Zone Instructions", "Begin Daytime Headlight Section", "End Daytime Headlight Section"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    // MARK: - Headlight / Visibility Requirements
//                    TrafficSign(
//                        title: "Headlight Use",
//                        description: "Indicates requirements for headlights, including use during rain, wipers, distance markers, daytime sections, or to check headlights.",
//                        images: ["R16-5", "R16-6", "R16-7", "R16-8", "R16-9", "R16-10", "R16-11"],
//                        wrongAnswers: ["Move Over / Reduce Speed", "No Hand-Held Phone Use", "Blasting Zone Instructions", "Yield", "Do Not Pass", "Stop", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//                    
//                    // MARK: - Driver Restrictions
//                    TrafficSign(
//                        title: "No Hand-Held Phone Use",
//                        description: "Prohibits drivers from using hand-held cell phones while operating a vehicle.",
//                        images: ["R16-15", "R16-15a"],
//                        wrongAnswers: ["Move Over / Reduce Speed", "Lights On When Using Wipers", "Lights On When Raining", "Check Headlights", "Blasting Zone Instructions", "Begin Daytime Headlight Section", "End Daytime Headlight Section"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Access & Restrictions"
//                    ),
//
//
//                ]
//            ),
//            TrafficSubSection(
//                index: 3,
//                name: "Special Users & Signals",
//                description: "Includes signs specific to bicycles, pedestrians, and other non-motorized users, as well as miscellaneous regulatory signs that ensure safety and indicate legal rights or restrictions for special road users.",
//                signs: [
//                    // Pedestrian guidance
//                    TrafficSign(
//                        title: "Pedestrian Walk Guidance",
//                        description: "Signs indicating where and how pedestrians should walk, including crossing locations and directions.",
//                        images: ["R9-1", "R9-2", "R9-3b"],
//                        wrongAnswers: ["Bicycles Use Shoulder Only", "No Skaters", "No Equestrians", "Keep Right", "Do Not Pass", "Lane-Assisted Guidance", "Bicycle All Turns"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    TrafficSign(
//                        title: "No Pedestrians",
//                        description: "Indicates areas where pedestrians are prohibited from crossing.",
//                        images: ["R9-3", "R9-3a"],
//                        wrongAnswers: ["Bicycles Use Shoulder Only", "No Skaters", "No Equestrians", "Keep Right", "Do Not Pass", "Lane-Assisted Guidance", "Bicycle All Turns"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "No Hitchhiking",
//                        description: "Indicates areas where hitchhiking is prohibited.",
//                        images: ["R9-4", "R9-4a"],
//                        wrongAnswers: ["Pedestrian Crosswalk", "Bicycle Lane", "Keep Right", "Do Not Pass", "Yield", "Stop", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Keep to Designated Path",
//                        description: "Indicates separate paths for bicyclists and pedestrians: bicyclists keep to the left, pedestrians to the right.",
//                        images: ["R9-7"],
//                        wrongAnswers: [
//                            "Bicycles Use Pedestrian Signal", "Bicycles Yield to Pedestrians",
//                            "Pedestrian Crosswalk", "No Pedestrians", "Keep Right", "Do Not Pass"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    TrafficSign(
//                        title: "Prohibited Users",
//                        description: "Prohibits certain users like skaters, equestrians, snowmobiles, or ATVs from using the roadway.",
//                        images: ["R9-13", "R9-14", "R9-15", "R9-16"],
//                        wrongAnswers: ["Bicycles Use Shoulder Only", "Pedestrian Crosswalk", "Keep Right", "Do Not Pass", "Lane-Assisted Guidance", "Bicycle All Turns", "Yield"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bicycle Instructions",
//                        description: "Indicates rules for bicyclists, including riding with traffic, following pedestrian signals, yielding the right-of-way, required lane exits, and whether bicycles must stay on the shoulder or may use the full lane.",
//                        images: ["R9-3c", "R9-5", "R9-6", "R9-22", "R9-20", "R9-21"],
//                        wrongAnswers: [
//                            "Pedestrian Walk Guidance", "No Pedestrians", "No Skaters",
//                            "No Equestrians", "Keep Right", "Do Not Pass", "Bicycles Left, Pedestrians Right",
//                            "Pedestrian Crosswalk", "Lane-Assisted Guidance", "No Snowmobiles",
//                            "Bicycle All Turns"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    // Bicycle turn control signs (grouped by arrow type)
//                    TrafficSign(
//                        title: "Bicycle Turn Directions",
//                        description: "Indicates turn directions for bicycles including U-turns, left turns, and all-turn lanes. Variants include diagonal, right, or straight arrows.",
//                        images: ["R9-23", "R9-23a", "R9-23b", "R9-23c", "R9-24", "R9-24a", "R9-25", "R9-25a", "R9-25b", "R9-26", "R9-26a", "R9-26b", "R9-27", "R9-27a", "R9-27b"],
//                        wrongAnswers: ["Pedestrian Crosswalk", "No Skaters", "Keep Right", "Do Not Pass", "Lane-Assisted Guidance", "No Equestrians", "Bicycles Use Shoulder Only"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Cross on Signal",
//                        description: "Indicates when pedestrians may cross, including green, pedestrian signal, and push button requirements.",
//                        images: ["R10-1", "R10-2", "R10-3", "R10-3a"],
//                        wrongAnswers: ["Left on Green Arrow Only", "Stop Here on Red", "Do Not Block Intersection", "Yield", "No Turn on Red", "Emergency Signal", "Photo Enforced"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    TrafficSign(
//                        title: "Crosswalk Signal Instructions",
//                        description: "Instructions for pedestrians at crosswalks, including push button operation and waiting for signals.",
//                        images: ["R10-3b", "R10-3c", "R10-3d", "R10-3e", "R10-3f", "R10-3g", "R10-3h", "R10-3i"],
//                        wrongAnswers: ["Left on Green Arrow Only", "Do Not Block Intersection", "Yield", "Emergency Signal", "Photo Enforced"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    // Turn on Green Arrow - General
//                    TrafficSign(
//                        title: "Turn on Green Arrow",
//                        description: "Indicates that drivers may turn in the direction of the green arrow when illuminated.",
//                        images: ["R10-5", "R10-8"],
//                        wrongAnswers: ["Cross on Signal", "Push Button for Green", "Do Not Block Intersection", "Stop Here on Red", "Emergency Signal", "Photo Enforced", "Yield"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Turn & Lane Signals",
//                        description: "Indicates dedicated left-, right-, or U-turn movements, including lane-specific turn signals, controlled by traffic signals.",
//                        images: ["R10-10R", "R10-10bR", "R10-10cR", "R10-10L", "R10-10bL", "R10-10cL", "R10-10a"],
//                        wrongAnswers: [
//                            "Cross on Signal",
//                            "Push Button for Green",
//                            "Do Not Block Intersection",
//                            "Stop Here on Red",
//                            "Yield"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    // Stop on Red
//                    TrafficSign(
//                        title: "Stop on Red",
//                        description: "Requires drivers to stop at a red signal before proceeding through the intersection.",
//                        images: ["R10-6", "R10-6aR", "R10-6aL", "R10-14b"],
//                        wrongAnswers: ["No Turn on Red", "Cross on Signal", "Push Button for Green", "Left on Green Arrow Only", "Do Not Block Intersection", "Emergency Signal", "Photo Enforced"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    // No Turn on Red
//                    TrafficSign(
//                        title: "No Turn on Red",
//                        description: "Prohibits turning on a red signal. Includes variations such as no turn on circular red or lane-specific restrictions.",
//                        images: ["R10-11", "R10-11a", "R10-11b", "R10-11c", "R10-11d"],
//                        wrongAnswers: ["Stop on Red", "Cross on Signal", "Push Button for Green", "Left on Green Arrow Only", "Do Not Block Intersection", "Emergency Signal", "Photo Enforced"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Turn Yield Signals",
//                        description: "Indicates that drivers making left turns or U-turns must yield according to signal rules, including green signals, flashing yellow arrows, or specific yield regulations for U-turns.",
//                        images: ["R10-12", "R10-12a", "R10-12b", "R10-27", "R10-16"],
//                        wrongAnswers: [
//                            "Cross on Signal",
//                            "Push Button for Green",
//                            "Stop on Red",
//                            "No Turn on Red",
//                            "Do Not Block Intersection",
//                            "Emergency Signal",
//                            "Photo Enforced"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Signals",
//                        description: "Indicates emergency signals requiring stopping on flashing red lights.",
//                        images: ["R10-13", "R10-14", "R10-14a"],
//                        wrongAnswers: ["Cross on Signal", "Push Button for Green", "Stop on Red", "No Turn on Red", "Yield", "Photo Enforced", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    TrafficSign(
//                        title: "Turning Vehicles Pedestrian Rules",
//                        description: "Indicates that drivers making turns must yield or stop for pedestrians as required to ensure safe crossing.",
//                        images: ["R10-15R", "R10-15L", "R10-15R_v2", "R10-15L_v2", "R10-15a"],
//                        wrongAnswers: [
//                            "Cross on Signal",
//                            "Push Button for Green",
//                            "Stop on Red",
//                            "Left Turn Yield",
//                            "Do Not Block Intersection",
//                            "Photo Enforced",
//                            "Lane-Assisted Guidance",
//                            "U-Turn Yield",
//                            "No Turn on Red"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Photo Enforcement",
//                        description: "Indicates traffic laws or signal compliance are monitored with cameras.",
//                        images: ["R10-18", "R10-18a", "R10-19P", "R10-19aP"],
//                        wrongAnswers: ["Cross on Signal", "Push Button for Green", "Stop on Red", "No Turn on Red", "Yield", "Do Not Block Intersection", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Traffic Signals",
//                        description: "Indicates mandatory or optional movements for bicycles including turn and through signals.",
//                        images: ["R10-22", "R10-26", "R10-40", "R10-40a", "R10-41", "R10-41a", "R10-41b", "R10-41c"],
//                        wrongAnswers: ["Cross on Signal", "Push Button for Green", "Stop on Red", "No Turn on Red", "Emergency Signal", "Photo Enforced", "Lane-Assisted Guidance"],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Single Vehicle per Green",
//                        description: "Specifies that only one vehicle may proceed per green signal cycle, either overall or per lane where indicated.",
//                        images: ["R10-28", "R10-29"],
//                        wrongAnswers: [
//                            "Right Turn on Red Must Yield to U-Turn",
//                            "Left Turn Yield on Flashing Red Arrow After Stop",
//                            "Push Button for 2 Seconds",
//                            "Stop on Red",
//                            "No Turn on Red",
//                            "Cross on Signal"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Right Turn on Red",
//                        description: "Allows right turns on red after a full stop; drivers must yield to U-turns where indicated.",
//                        images: ["R10-17a", "R10-30"],
//                        wrongAnswers: [
//                            "Cross on Signal",
//                            "Push Button for Green",
//                            "No Turn on Red",
//                            "Yield",
//                            "Do Not Block Intersection",
//                            "Photo Enforced",
//                            "One Vehicle per Green",
//                            "1 Vehicle per Green Each Lane",
//                            "Push Button for 2 Seconds",
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Push Button for Pedestrian Signal",
//                        description: "Indicates a push button that activates the pedestrian green signal. In some cases, pressing for 2 seconds provides extra crossing time for pedestrians or bicyclists.",
//                        images: ["R10-4", "R10-4a", "R10-32P"],
//                        wrongAnswers: [
//                            "Stop Here on Red",
//                            "Left on Green Arrow Only",
//                            "Do Not Block Intersection",
//                            "Yield",
//                            "No Turn on Red",
//                            "Emergency Signal",
//                            "Photo Enforced",
//                            "One Vehicle per Green",
//                            "1 Vehicle per Green Each Lane",
//                            "Cross on Signal"
//                        ],
//                        sectionName: "Regulatory Signs",
//                        subSectionName: "Special Users & Signals"
//                    ),
//                ]
//            )
//        ],
//        signs: []
//    )
//    
//    static let warningSigns = TrafficSection(
//        name: "Warning Signs",
//        description: "Warns drivers of roadway conditions, changes, or hazards that may require caution, reduced speed, or special attention.",
//        subSections: [
//            TrafficSubSection(
//                index: 1,
//                name: "Road Alignment",
//                description: "Indicates changes in the roadway’s direction or layout, including turns, curves, hills, and divided highways. Helps drivers anticipate horizontal and vertical shifts to navigate safely.",
//                signs: [
//                    // TURN SIGNS
//                    TrafficSign(
//                        title: "Turn Ahead",
//                        description: "Warns of a sharp turn ahead in the direction indicated.",
//                        images: ["W1-1R", "W1-1L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Reverse Turn",
//                        description: "Warns of two close turns in opposite directions.",
//                        images: ["W1-3R", "W1-3L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Sharp Turn",
//                        description: "Warns drivers of a sharp change in direction of travel at a curve or intersection.",
//                        images: ["W1-6R", "W1-6L", "W1-7"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    
//                    // CURVE SIGNS
//                    TrafficSign(
//                        title: "Curve Ahead",
//                        description: "Warns of a curve ahead in the direction indicated.",
//                        images: ["W1-2R", "W1-2L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Reverse Curve",
//                        description: "Warns of two close curves in opposite directions.",
//                        images: ["W1-4R", "W1-4L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Directional Curve",
//                        description: "Indicates a sharp change in horizontal alignment requiring reduced speed and attention.",
//                        images: ["W1-8R", "W1-8L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Curve with Intersection",
//                        description: "Warns of a curve that also includes a side road, crossroad, or tangent connection.",
//                        images: [
//                            "W1-10R", "W1-10L",
//                            "W1-10aR", "W1-10aL",
//                            "W1-10bR", "W1-10bL",
//                            "W1-10cR", "W1-10cL",
//                            "W1-10dR", "W1-10dL",
//                            "W1-10eR", "W1-10eL"
//                        ],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Winding Road",
//                        description: "Warns of a series of curves or turns ahead.",
//                        images: ["W1-5R", "W1-5L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Hairpin Curve",
//                        description: "Warns of a very sharp curve, often requiring a low advisory speed.",
//                        images: ["W1-11R", "W1-11L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Truck Rollover Warning",
//                        description: "Advises trucks of a high rollover risk on the curve ahead.",
//                        images: ["W1-13R", "W1-13L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "270-Degree Loop Curve",
//                        description: "Warns of a sharp 270-degree loop curve ahead, requiring low speeds.",
//                        images: ["W1-15R", "W1-15L"],
//                        wrongAnswers: ["Lane Shift", "Intersection Ahead", "Steep Hill", "Narrow Bridge", "Bump", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Crossroad",
//                        description: "Warns of an upcoming four-way intersection.",
//                        images: ["W2-1"],
//                        wrongAnswers: ["T-Intersection", "Y-Intersection", "Side Road", "Roundabout", "Merge", "Stop Ahead", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Side Road",
//                        description: "Warns of a side road joining the main road from the direction indicated.",
//                        images: ["W2-2R", "W2-2L"],
//                        wrongAnswers: ["Crossroad", "T-Intersection", "Y-Intersection", "Roundabout", "Merge", "Stop Ahead", "Curve Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Angled Side Road",
//                        description: "Warns of a side road joining the main road at an acute or obtuse angle.",
//                        images: ["W2-3R", "W2-3L", "W2-3aR", "W2-3aL"],
//                        wrongAnswers: ["Side Road", "Crossroad", "Y-Intersection", "Roundabout", "Merge", "Curve Ahead", "Stop Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "T-Intersection",
//                        description: "Warns of a road ahead that ends, requiring traffic to turn either left or right.",
//                        images: ["W2-4"],
//                        wrongAnswers: ["Crossroad", "Y-Intersection", "Side Road", "Roundabout", "Merge", "Stop Ahead", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Y-Intersection",
//                        description: "Warns of a Y-shaped intersection ahead where the road splits into two directions.",
//                        images: ["W2-5"],
//                        wrongAnswers: ["T-Intersection", "Crossroad", "Roundabout", "Merge", "Curve Ahead", "Stop Ahead", "Side Road"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Roundabout",
//                        description: "Warns of a roundabout or circular intersection ahead.",
//                        images: ["W2-6"],
//                        wrongAnswers: ["Crossroad", "T-Intersection", "Y-Intersection", "Merge", "Stop Ahead", "Curve Ahead", "Traffic Signal Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Offset Side Roads",
//                        description: "Warns of two closely spaced side roads entering from opposite sides of the main road.",
//                        images: ["W2-7R", "W2-7L"],
//                        wrongAnswers: ["Crossroad", "T-Intersection", "Y-Intersection", "Double Side Roads", "Roundabout", "Merge", "Curve Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Double Side Roads",
//                        description: "Warns of two side roads entering from the same side of the main road.",
//                        images: ["W2-8R", "W2-8L"],
//                        wrongAnswers: ["Offset Side Roads", "Crossroad", "T-Intersection", "Y-Intersection", "Roundabout", "Merge", "Stop Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Traffic Warning When Flashing",
//                        description: "Warns drivers that traffic may be entering or approaching the roadway when the light is flashing, advising caution at the intersection.",
//                        images: ["W2-10", "W2-11"],
//                        wrongAnswers: [
//                            "Stop Ahead",
//                            "Yield Ahead",
//                            "Merge",
//                            "Roundabout",
//                            "Traffic Signal Ahead",
//                            "Pedestrian Crossing",
//                            "Curve Ahead"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Divided Highway Begins",
//                        description: "Warns that a divided highway begins ahead. The road will have a median or barrier separating opposing directions of traffic.",
//                        images: ["W6-1"],
//                        wrongAnswers: ["Divided Highway Ends", "Two-Way Traffic", "Keep Right", "Merge Left", "Lane Ends", "Road Narrows", "Slippery When Wet"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Divided Highway Ends",
//                        description: "Warns that a divided highway is ending ahead and opposing traffic will soon share the same roadway.",
//                        images: ["W6-2"],
//                        wrongAnswers: ["Divided Highway Begins", "Two-Way Traffic", "Merge Right", "Keep Right", "Road Narrows", "Yield", "Stop Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Two-Way Traffic",
//                        description: "Indicates that traffic flows in both directions. May also be used on three-lane roadways where one direction has two lanes and the other has one. Drivers should stay to the right of the center line and use extra caution when passing.",
//                        images: ["W6-3", "W6-5", "W6-5a"],
//                        wrongAnswers: [
//                            "Divided Highway Begins",
//                            "Divided Highway Ends",
//                            "Keep Right",
//                            "Merge Left",
//                            "Merge Right",
//                            "Lane Ends",
//                            "Do Not Pass",
//                            "Slippery When Wet",
//                            "Road Narrows"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Steep Grade / Hill",
//                        description: "Warns of a steep grade or downhill slope ahead. May display a truck descending symbol or slope percentage.",
//                        images: ["W7-1", "W7-1A", "W7-1A_v2"],
//                        wrongAnswers: ["Hill Blocks View", "Bicycle Hill", "Slippery When Wet", "Winding Road", "Falling Rocks", "Rough Road", "Narrow Bridge"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Use Low Gear",
//                        description: "Advises drivers, especially trucks, to shift into a lower gear before descending a steep grade.",
//                        images: ["W7-2P", "W7-2bP"],
//                        wrongAnswers: ["Runaway Truck Ramp", "Hill Blocks View", "Stop Ahead", "Truck Crossing", "Road Narrows", "Bicycle Hill", "Slippery When Wet"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Grade Distance / Percentage Plaques",
//                        description: "Indicates the percent of grade or the length of the hill section ahead. Used with primary hill warning signs.",
//                        images: ["W7-3P", "W7-3aP", "W7-3bP"],
//                        wrongAnswers: ["Runaway Truck Ramp", "Use Low Gear", "Hill Blocks View", "Slippery When Wet", "Stop Ahead", "Bicycle Hill", "Falling Rocks"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Runaway Truck Ramp",
//                        description: "Indicates the location or distance to a runaway truck escape ramp.",
//                        images: ["W7-4", "W7-4b", "W7-4c"],
//                        wrongAnswers: ["Use Low Gear", "Hill Blocks View", "Slippery When Wet", "Truck Crossing", "Stop Ahead", "Falling Rocks", "Bicycle Hill"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "Hill (Bicycle)",
//                        description: "Warns bicyclists of steep downhill or uphill grades ahead.",
//                        images: ["W7-5"],
//                        wrongAnswers: ["Steep Grade", "Truck Hill", "Slippery When Wet", "Curve Ahead", "Winding Road", "Bicycle Crossing", "Pedestrian Crossing"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    ),
//                    TrafficSign(
//                        title: "View Obstructed Ahead",
//                        description: "Warns that an upcoming hill obstructs the driver’s view of oncoming traffic or hazards.",
//                        images: ["W7-6"],
//                        wrongAnswers: ["Steep Grade", "Falling Rocks", "Winding Road", "Curve Ahead", "Stop Ahead", "Narrow Bridge"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Alignment"
//                    )
//
//
//
//                ]
//            ),
//            TrafficSubSection(
//                index: 2,
//                name: "Traffic Merging",
//                description: "Alerts drivers to lane reductions, merges, lane shifts, or upcoming transitions that affect the normal flow of vehicles, including work zones, ramps, and intersections.",
//                signs: [
//                    TrafficSign(
//                        title: "Stop Sign Ahead",
//                        description: "Warns drivers that a stop sign is ahead, requiring them to prepare to stop at the intersection.",
//                        images: ["W3-1"],
//                        wrongAnswers: ["Yield Sign Ahead", "Traffic Light Ahead", "Speed Limit Ahead", "Ramp Meter Ahead", "Draw Bridge Ahead", "Traffic Using Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Yield Sign Ahead",
//                        description: "Warns that a yield sign is ahead so drivers can prepare to slow and give way to traffic.",
//                        images: ["W3-2"],
//                        wrongAnswers: ["Stop Sign Ahead", "Traffic Light Ahead", "Speed Limit Ahead", "Ramp Meter Ahead", "Draw Bridge Ahead", "Traffic Using Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Traffic Light Ahead",
//                        description: "Warns that a traffic signal is ahead, advising drivers to prepare for possible red lights.",
//                        images: ["W3-3"],
//                        wrongAnswers: ["Stop Sign Ahead", "Yield Sign Ahead", "Be Prepared to Stop", "Speed Limit Ahead", "Ramp Meter Ahead", "Draw Bridge Ahead", "Traffic Using Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Stop Ahead Warning",
//                        description: "Alerts drivers that they may need to stop unexpectedly due to upcoming traffic control or congestion.",
//                        images: ["W3-4"],
//                        wrongAnswers: ["Yield Sign Ahead", "Traffic Light Ahead", "Speed Limit Ahead", "Ramp Meter Ahead", "Draw Bridge Ahead", "Traffic Using Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Speed Limit Ahead",
//                        description: "Warns of a change in the speed limit or a speed-controlled zone ahead, including variable or truck speed zones.",
//                        images: ["W3-5", "W3-5a", "W3-5b", "W3-5c"],
//                        wrongAnswers: ["Stop Sign Ahead", "Yield Sign Ahead", "Be Prepared to Stop", "Traffic Light Ahead", "Ramp Meter Ahead", "Draw Bridge Ahead", "Traffic Using Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Drawbridge Warning",
//                        description: "Warns of a drawbridge ahead that may be open for marine traffic.",
//                        images: ["W3-6"],
//                        wrongAnswers: ["Narrow Bridge", "Low Clearance Bridge", "Bridge Under Construction", "Be Prepared to Stop", "Speed Limit Ahead", "Ramp Meter Ahead", "Bridge Deck Damage"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Ramp Meter Warning",
//                        description: "Warns drivers of ramp metering ahead, where traffic lights control ramp entry. The meter operates when the light is flashing.",
//                        images: ["W3-7", "W3-8"],
//                        wrongAnswers: [
//                            "Stop Sign Ahead",
//                            "Yield Sign Ahead",
//                            "Traffic Light Ahead",
//                            "Be Prepared to Stop",
//                            "Speed Limit Ahead",
//                            "Drawbridge Ahead",
//                            "Traffic Using Shoulder"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Traffic Using Shoulder",
//                        description: "Warns that shoulder lanes may be open for travel during specified times or conditions.",
//                        images: ["W3-9"],
//                        wrongAnswers: ["Stop Sign Ahead", "Yield Sign Ahead", "Traffic Light Ahead", "Be Prepared to Stop", "Speed Limit Ahead", "Ramp Meter Ahead", "Drawbridge Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Merge",
//                        description: "Warns that traffic lanes will merge ahead. Drivers should prepare to merge safely with traffic from the indicated side.",
//                        images: ["W4-1R", "W4-1L"],
//                        wrongAnswers: ["Lane Ends", "Added Lane", "Cross Traffic Does Not Stop", "No Merge Area", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Added Lane",
//                        description: "Warns that a new lane is joining the roadway, so merging is not required.",
//                        images: ["W4-3R", "W4-3L", "W4-6R", "W4-6L"],
//                        wrongAnswers: ["Merge", "Lane Ends", "Heavy Merge", "Single Lane Transition", "Cross Traffic Does Not Stop", "No Merge Area", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Traffic Does Not Stop",
//                        description: "Used as a plaque under intersection warning signs to inform drivers that cross or oncoming traffic does not stop.",
//                        images: ["W4-4P", "W4-4aPR", "W4-4aP", "W4-4bP"],
//                        wrongAnswers: ["Merge", "Lane Ends", "Added Lane", "Heavy Merge", "Single Lane Transition", "No Merge Area", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Merge from Side Road",
//                        description: "Warns of vehicles merging onto the main roadway from a side entrance or ramp.",
//                        images: ["W4-5R", "W4-5L"],
//                        wrongAnswers: ["Lane Ends", "Added Lane", "Heavy Merge", "Single Lane Transition", "Cross Traffic Does Not Stop", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "No Merge Area",
//                        description: "Indicates that merging is not possible where two roadways join.",
//                        images: ["W4-5aP"],
//                        wrongAnswers: ["Merge", "Lane Ends", "Added Lane", "Heavy Merge", "Single Lane Transition", "Cross Traffic Does Not Stop", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Heavy Merge",
//                        description: "Warns of a heavy volume of merging traffic from the indicated direction.",
//                        images: ["W4-7R", "W4-7L"],
//                        wrongAnswers: ["Lane Ends", "Added Lane", "Single Lane Transition", "Cross Traffic Does Not Stop", "No Merge Area", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Single Lane Transition",
//                        description: "Indicates that multiple lanes will transition into a single lane ahead.",
//                        images: ["W4-8"],
//                        wrongAnswers: ["Merge", "Lane Ends", "Added Lane", "Heavy Merge", "Cross Traffic Does Not Stop", "No Merge Area", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Lane Ends",
//                        description: "Warns that a lane will end ahead, requiring drivers to merge into an adjacent lane.",
//                        images: ["W9-1R", "W9-1L"],
//                        wrongAnswers: ["Lanes Merge", "Pay Toll Ahead", "Take Ticket Ahead", "Shoulder Ends", "Road Narrows", "Slippery When Wet", "Bump"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Lanes Merge",
//                        description: "Indicates that two or more lanes of traffic will merge into one lane ahead.",
//                        images: ["W9-4"],
//                        wrongAnswers: ["Right Lane Ends", "Left Lane Ends", "Bicycle Lane Ends", "Exit Only Lane", "Pay Toll Ahead", "Take Ticket Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Lane Ends",
//                        description: "Warns that a lane is ending ahead. Some signs also indicate the direction of the merge, showing whether traffic must merge right or left.",
//                        images: ["W4-2R", "W4-2L", "W9-2R", "W9-2L"],
//                        wrongAnswers: [
//                            "Added Lane",
//                            "Heavy Merge",
//                            "Single Lane Transition",
//                            "Cross Traffic Does Not Stop",
//                            "No Merge Area",
//                            "Yield",
//                            "Pay Toll Ahead",
//                            "Take Ticket Ahead",
//                            "Shoulder Ends",
//                            "Road Narrows",
//                            "Bicycle Lane Ends",
//                            "Exit Only Lane",
//                            "Soft Shoulder"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Lane Transition",
//                        description: "Indicates that the bicycle lane is ending and cyclists will be merging into the adjacent traffic lane. Drivers should be alert and allow safe merging.",
//                        images: ["W9-5", "W9-5a"],
//                        wrongAnswers: [
//                            "Added Lane",
//                            "Heavy Merge",
//                            "Single Lane Transition",
//                            "Exit Only Lane",
//                            "Pay Toll Ahead",
//                            "Take Ticket Ahead"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Pay Toll Ahead",
//                        description: "Warns drivers to prepare to pay a toll or that a toll plaza is approaching.",
//                        images: ["W9-6", "W9-6a", "W9-6bP", "W9-6cP", "W9-6dP"],
//                        wrongAnswers: ["Take Ticket Ahead", "Exit Only Lane", "Bicycle Lane Ends", "Right Lane Ends", "Left Lane Ends", "Lanes Merge", "Lane Ends Merge Right"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Take Ticket Ahead",
//                        description: "Warns drivers that a ticket or toll receipt is required ahead.",
//                        images: ["W9-6e", "W9-6f", "W9-6gP", "W9-6hP"],
//                        wrongAnswers: ["Pay Toll Ahead", "Exit Only Lane", "Bicycle Lane Ends", "Right Lane Ends", "Left Lane Ends", "Lanes Merge", "Lane Ends Merge Left"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    ),
//                    TrafficSign(
//                        title: "Exit Only Lane",
//                        description: "Warns that the right or left lane is for exit only and will not continue through.",
//                        images: ["W9-7R", "W9-7L"],
//                        wrongAnswers: ["Right Lane Ends", "Left Lane Ends", "Lanes Merge", "Bicycle Lane Ends", "Pay Toll Ahead", "Take Ticket Ahead", "Lane Ends Merge Right"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Traffic Merging"
//                    )
//
//
//                ]
//            ),
//            TrafficSubSection(
//                index: 3,
//                name: "Surface Conditions",
//                description: "Warns of conditions affecting traction, comfort, or vehicle control, such as bumps, dips, gravel, flooding, icy patches, and narrow lanes.",
//                signs: [
//                    
//                    TrafficSign(
//                        title: "Single-Lane Passage",
//                        description: "Warns that the bridge or underpass ahead allows only one direction of traffic at a time. Drivers must yield to oncoming vehicles and proceed with caution.",
//                        images: ["W5-3", "W5-3a"],
//                        wrongAnswers: [
//                            "Narrow Bridge",
//                            "Road Narrows",
//                            "Ramp Narrows",
//                            "Path Narrows",
//                            "Keep Right",
//                            "Stop",
//                            "Yield",
//                            "Do Not Enter"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    TrafficSign(
//                        title: "Roadway Narrows",
//                        description: "Warns that the road, ramp, bridge, or shared-use path ahead becomes narrower. Drivers, cyclists, and pedestrians should adjust speed and position accordingly.",
//                        images: ["W5-1", "W5-2", "W5-4", "W5-4a"],
//                        wrongAnswers: [
//                            "One Lane Bridge",
//                            "Merge Right",
//                            "Keep Right",
//                            "Yield",
//                            "Stop",
//                            "Do Not Pass"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bump",
//                        description: "Warns drivers of a bump in the road surface ahead that may cause discomfort or vehicle instability at higher speeds.",
//                        images: ["W8-1"],
//                        wrongAnswers: ["Dip", "Rough Road", "Uneven Lanes", "Low Shoulder", "Pavement Ends", "Soft Shoulder", "Slippery When Wet", "Loose Gravel"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Dip",
//                        description: "Warns drivers of a dip in the road surface ahead that may cause discomfort or vehicle instability at higher speeds.",
//                        images: ["W8-2"],
//                        wrongAnswers: ["Bump", "Rough Road", "Uneven Lanes", "Low Shoulder", "Pavement Ends", "Soft Shoulder", "Slippery When Wet", "Loose Gravel"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    TrafficSign(
//                        title: "Pavement Ends",
//                        description: "Warns that a paved surface ends and vehicles may transition to an unpaved or less stable surface.",
//                        images: ["W8-3"],
//                        wrongAnswers: ["Soft Shoulder", "Bump", "Low Shoulder", "Uneven Lanes", "Slippery When Wet", "Loose Gravel", "Bridge Ices Before Road", "Grooved Pavement"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Soft Shoulder",
//                        description: "Warns that the shoulder is composed of softer material that may not support vehicles.",
//                        images: ["W8-4"],
//                        wrongAnswers: ["Pavement Ends", "Bump", "Low Shoulder", "Uneven Lanes", "Slippery When Wet", "Loose Gravel", "Bridge Ices Before Road", "Grooved Pavement"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    TrafficSign(
//                        title: "Slippery When Wet",
//                        description: "Indicates road surfaces that become slippery when wet or icy",
//                        images: ["W8-5"],
//                        wrongAnswers: ["Loose Gravel", "Rough Road", "Bridge Ices Before Road", "Truck Crossing", "Soft Shoulder", "Uneven Lanes", "Fog Area"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bicycle Slippery When Wet",
//                        description: "Warns bicyclists of slippery conditions caused by water or weather. May include supplemental plaques.",
//                        images: ["W8-10"],
//                        wrongAnswers: ["Slippery When Wet", "Truck Crossing", "Grooved Pavement", "Rough Road", "Bump", "Fallen Rocks", "Soft Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    TrafficSign(
//                        title: "Road Surface & Crossing Hazards",
//                        description: "Warns drivers of various road conditions and crossing hazards ahead, including trucks entering, loose gravel, rough pavement, low or uneven shoulders, missing centerlines, icy bridges, fallen rocks, grooved pavement, metal bridge decks, and road may flood.",
//                        images: ["W8-6", "W8-7", "W8-8", "W8-9", "W8-11", "W8-12", "W8-13", "W8-14", "W8-15", "W8-16", "W8-18"],
//                        wrongAnswers: ["Fog Area", "Deer Crossing", "Slippery When Wet", "Soft Shoulder", "Bump", "Narrow Bridge", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    TrafficSign(
//                        title: "Shoulder Drop-Off",
//                        description: "Warns of a significant shoulder drop-off that may cause difficulty returning to the pavement.",
//                        images: ["W8-17R", "W8-17L", "W8-17P"],
//                        wrongAnswers: ["Pavement Ends", "Uneven Lanes", "Rough Road", "Loose Gravel", "Slippery When Wet"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Depth Gauge",
//                        description: "Displays a depth gauge to indicate water levels in flood-prone areas.",
//                        images: ["W8-19"],
//                        wrongAnswers: ["Road May Flood", "Fog Area", "Bridge Ices Before Road", "Loose Gravel", "Rough Road", "Hill Blocks View", "Soft Shoulder", "Bump"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Weather Hazard Ahead",
//                        description: "Warns drivers of areas with environmental conditions that may affect safety, such as strong gusty winds or reduced visibility due to fog. Adjust speed and exercise caution.",
//                        images: ["W8-21", "W8-22"],
//                        wrongAnswers: [
//                            "Bridge Ices Before Road",
//                            "Loose Gravel",
//                            "Rough Road",
//                            "Fallen Rocks",
//                            "Deer Crossing",
//                            "Road Narrows"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Shoulder Unavailable Ahead",
//                        description: "Warns that the road shoulder will be absent or unavailable ahead. Drivers should adjust their position and stay within the travel lanes.",
//                        images: ["W8-23", "W8-25"],
//                        wrongAnswers: [
//                            "Soft Shoulder",
//                            "Low Shoulder",
//                            "Uneven Lanes",
//                            "Pavement Ends",
//                            "Rough Road",
//                            "Bump",
//                            "Loose Gravel"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Dead-End Ahead",
//                        description: "Indicates that the roadway ahead does not continue. Drivers must stop or turn as the road terminates.",
//                        images: ["W8-26", "W8-26a"],
//                        wrongAnswers: [
//                            "Road Narrows",
//                            "No Outlet",
//                            "Curve Ahead",
//                            "Soft Shoulder",
//                            "Uneven Lanes",
//                            "Slippery When Wet"
//                        ],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Surface Conditions"
//                    ),
//
//                ]
//            ),
//            TrafficSubSection(
//                index: 4,
//                name: "Crossing Points",
//                description: "Marks areas where vehicles intersect with trains, trams, or light rail and highlights nearby fixed objects or hazards.",
//                signs: [
//                    TrafficSign(
//                        title: "Railroad Crossing Ahead",
//                        description: "Indicates that a railroad crossing is ahead. Includes plaques for exemptions.",
//                        images: ["W10-1"],
//                        wrongAnswers: ["Side Road Ahead", "Drawbridge Ahead", "Lane Ends", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Railroad Crossing with Parallel Tracks",
//                        description: "Indicates crossings where parallel tracks intersect the roadway. Variants indicate orientation (left or right).",
//                        images: ["W10-2R", "W10-2L", "W10-3R", "W10-3L", "W10-4R", "W10-4L"],
//                        wrongAnswers: ["Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Low Ground Clearance Crossing",
//                        description: "Warns of railroad crossings with low clearance for vehicles. Includes optional plaques.",
//                        images: ["W10-5", "W10-5P"],
//                        wrongAnswers: ["Railroad Crossing Ahead", "Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Light Rail Transit Approaching",
//                        description: "Indicates that a light rail vehicle is approaching. May include activated signals or blank-out signs.",
//                        images: ["W10-7"],
//                        wrongAnswers: ["Train Speed Warning", "No Train Horn", "Railroad Crossing Ahead", "Lane Ends", "Soft Shoulder", "Road Narrows", "Side Road Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Train Speed Warning",
//                        description: "Warns that trains may exceed a specified speed at the crossing.",
//                        images: ["W10-8"],
//                        wrongAnswers: ["Light Rail Transit Approaching", "No Train Horn", "Railroad Crossing Ahead", "Lane Ends", "Soft Shoulder", "Road Narrows", "Side Road Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    
//                    TrafficSign(
//                        title: "No Train Horn",
//                        description: "Indicates that no train horn warning is provided at this crossing. Includes optional plaque.",
//                        images: ["W10-9", "W10-9P"],
//                        wrongAnswers: ["Light Rail Transit Approaching", "Train Speed Warning", "Railroad Crossing Ahead", "Lane Ends", "Soft Shoulder", "Road Narrows", "Side Road Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Crossing Storage Space",
//                        description: "Indicates the general space available between the tracks and the highway at the crossing.",
//                        images: ["W10-11"],
//                        wrongAnswers: ["Distance Ahead", "Distance Behind", "Railroad Crossing Ahead", "Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Soft Shoulder"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Crossing Distance",
//                        description: "Provides distance information for the crossing: either the distance to the crossing or the distance behind the tracks for clearance.",
//                        images: ["W10-11a", "W10-11b"],
//                        wrongAnswers: ["General Storage Space", "Railroad Crossing Ahead", "Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Skewed Railroad Crossings",
//                        description: "Warns drivers of skewed railroad crossings ahead; supplements standard W10-1 crossing signs.",
//                        images: ["W10-12R", "W10-12L"],
//                        wrongAnswers: ["Railroad Crossing Ahead", "Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Crossing Condition Plaques",
//                        description: "Plaques providing additional information, such as no gates or lights, next crossing, use next crossing, or rough crossings.",
//                        images: ["W10-13P", "W10-14P", "W10-14aP", "W10-15P"],
//                        wrongAnswers: ["Railroad Crossing Ahead", "Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Activated Warnings",
//                        description: "Signs that are activated (blank-out) to warn of another train approaching.",
//                        images: ["W10-16"],
//                        wrongAnswers: ["Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Busway Crossings",
//                        description: "Indicates a busway crossing and optional plaques for signals ahead.",
//                        images: ["W10-21"],
//                        wrongAnswers: ["Railroad Crossing Ahead", "Lane Ends", "Side Road Ahead", "Pay Toll Ahead", "Take Ticket Ahead", "Soft Shoulder", "Road Narrows"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Object Marker",
//                        description: "Marks a fixed object directly ahead or close to the edge of the road, such as a median island or obstruction. Indicates a hazard that should be avoided.",
//                        images: ["OM1-1", "OM1-2", "OM1-3"],
//                        wrongAnswers: ["Culvert Marker", "Chevron Alignment", "End of Road", "Keep Right", "Keep Left", "Merge", "Curve Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Culvert Marker",
//                        description: "Used to mark culverts or similar roadside hazards near the edge of the pavement. Guides drivers to stay clear of the structure.",
//                        images: ["OM2-1V", "OM2-1H", "OM2-2V", "OM2-2H"],
//                        wrongAnswers: ["Object Marker", "End of Road", "Chevron Alignment", "Keep Right", "Divided Highway", "Narrow Bridge", "Merge"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "Directional Object Marker",
//                        description: "Indicates which side of an obstruction drivers should pass — left, right, or either side — depending on arrow orientation.",
//                        images: ["OM3-R", "OM3-C", "OM3-L"],
//                        wrongAnswers: ["Culvert Marker", "Object Marker", "End of Road", "Chevron Alignment", "Keep Right", "Keep Left", "Merge"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    ),
//                    TrafficSign(
//                        title: "End of Road Marker",
//                        description: "Warns drivers that the road ends ahead. Commonly placed at T-intersections or dead ends.",
//                        images: ["OM4-1", "OM4-2", "OM4-3"],
//                        wrongAnswers: ["Object Marker", "Culvert Marker", "Chevron Alignment", "Dead End", "Keep Right", "Merge", "Stop Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Crossing Points"
//                    )
//
//
//                ]
//            ),
//            TrafficSubSection(
//                index: 5,
//                name: "Road Users",
//                description: "Warns of pedestrians, cyclists, animals, or other non-motorized users that share or cross the roadway.",
//                signs: [
//                    // Bicycles
//                    TrafficSign(
//                        title: "Bicycles",
//                        description: "Indicates areas where bicycles are likely to be present.",
//                        images: ["W11-1"],
//                        wrongAnswers: ["Pedestrians", "Farm Vehicles", "Emergency Vehicle", "Golf Cart", "Road Narrows", "Steep Hill", "Slippery When Wet"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    // Pedestrians
//                    TrafficSign(
//                        title: "Pedestrians",
//                        description: "Indicates areas where pedestrians are likely to be present.",
//                        images: ["W11-2"],
//                        wrongAnswers: ["Bicycles", "Farm Vehicles", "Emergency Vehicle", "Golf Cart", "Road Narrows", "Steep Hill", "Slippery When Wet"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    // Bicycles and Pedestrians / Trail
//                    TrafficSign(
//                        title: "Bicycles and Pedestrians",
//                        description: "Indicates areas where both bicycles and pedestrians are present.",
//                        images: ["W11-15"],
//                        wrongAnswers: ["Bicycles only", "Pedestrians only", "Farm Vehicles", "Emergency Vehicle", "Golf Cart", "Road Narrows", "Steep Hill"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    // Farm, Emergency, and Special Vehicles
//                    TrafficSign(
//                        title: "Special Vehicles",
//                        description: "Indicates potential presence of farm vehicles, emergency vehicles, trucks, or golf carts on the road ahead.",
//                        images: ["W11-5", "W11-8", "W11-10", "W11-11"],
//                        wrongAnswers: ["Bicycles", "Pedestrians", "Animals", "Road Narrows", "Slippery When Wet", "Steep Hill", "Trail Crossing"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Snowmobile",
//                        description: "Indicates that snowmobiles may be present on or near the roadway.",
//                        images: ["W11-6"],
//                        wrongAnswers: ["Bicycles", "Pedestrians", "Farm Vehicles", "Emergency Vehicle", "Golf Cart", "Animals", "Trail Crossing"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Equestrian",
//                        description: "Indicates that horseback riders may be present on or near the roadway.",
//                        images: ["W11-7"],
//                        wrongAnswers: ["Bicycles", "Pedestrians", "Farm Vehicles", "Emergency Vehicle", "Golf Cart", "Animals", "Trail Crossing"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Handicapped",
//                        description: "Indicates that handicapped pedestrians may be present in the area or crossing the roadway.",
//                        images: ["W11-9"],
//                        wrongAnswers: ["Bicycles", "Pedestrians", "Farm Vehicles", "Emergency Vehicle", "Golf Cart", "Animals", "Trail Crossing"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Signal Ahead",
//                        description: "Indicates that an emergency signal is ahead and drivers should be prepared to stop or yield as appropriate.",
//                        images: ["W11-12P"],
//                        wrongAnswers: ["Bicycles", "Pedestrians", "Farm Vehicles", "Animals", "Handicapped", "Golf Cart", "Trail Crossing"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    // Horse-drawn vehicles
//                    TrafficSign(
//                        title: "Horse-drawn Vehicles",
//                        description: "Warns that horse-drawn vehicles may be on the road ahead.",
//                        images: ["W11-14"],
//                        wrongAnswers: ["Bicycles", "Pedestrians", "Emergency Vehicle", "Golf Cart", "Animals", "Road Narrows", "Steep Hill"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    ),
//                    
//                    // Animals grouped
//                    TrafficSign(
//                        title: "Animals",
//                        description: "Indicates potential presence of animals such as deer, bear, elk, moose, sheep, ram, donkey, or wild horses on the road ahead.",
//                        images: ["W11-3", "W11-4", "W11-16", "W11-17", "W11-18", "W11-19", "W11-20", "W11-21", "W11-22"],
//                        wrongAnswers: ["Farm Vehicles", "Emergency Vehicle", "Bicycles", "Pedestrians", "Golf Cart", "Road Narrows", "Steep Hill"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "Road Users"
//                    )
//                ]
//            ),
//            TrafficSubSection(
//                index: 6,
//                name: "General Warnings",
//                description: "Covers miscellaneous warnings such as low clearance, dead ends, narrow roads, or other unique roadway situations.",
//                signs: [
//                    // Double Arrow
//                    TrafficSign(
//                        title: "Two-Direction Traffic (Double Arrow)",
//                        description: "Indicates a location where traffic can move in both directions, often marking the end of a one-way road or a traffic island at a T-intersection.",
//                        images: ["W12-1"],
//                        wrongAnswers: ["Low Clearance", "Lane Ends", "Bump", "Divided Highway Begins", "Railroad Crossing", "Stop Ahead", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    // Low Clearance
//                    TrafficSign(
//                        title: "Low Clearance",
//                        description: "Warns drivers of overhead structures with limited vertical clearance, including bridges or tunnels.",
//                        images: ["W12-2", "W12-2a", "W12-2b"],
//                        wrongAnswers: ["Double Arrow", "Lane Ends", "Bump", "Soft Shoulder", "Railroad Crossing", "Stop Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    TrafficSign(
//                        title: "Speed Advisory",
//                        description: "Indicates the recommended speed for a section of roadway, including optional confirmation plaques.",
//                        images: ["W13-1P", "W13-1aP"],
//                        wrongAnswers: ["Exit Speed Advisory", "Ramp Speed Advisory", "Variable Speed Feedback", "Low Clearance", "Bump", "Lane Ends", "Do Not Enter"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Exit Speed Advisory",
//                        description: "Provides recommended speeds for roadway exits, including curves, hairpins, 270-degree loops, and truck rollover areas.",
//                        images: ["W13-2", "W13-6", "W13-8", "W13-10", "W13-12"],
//                        wrongAnswers: ["Ramp Speed Advisory", "Speed Advisory", "Variable Speed Feedback", "Lane Ends", "Bump", "Low Clearance", "Divided Highway Begins"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Ramp Speed Advisory",
//                        description: "Provides recommended speeds for ramp sections, including curves, hairpins, 270-degree loops, and truck rollover areas.",
//                        images: ["W13-3", "W13-7", "W13-9", "W13-11", "W13-13"],
//                        wrongAnswers: ["Exit Speed Advisory", "Speed Advisory", "Variable Speed Feedback", "Lane Ends", "Bump", "Soft Shoulder", "Railroad Crossing Ahead"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Variable Speed Feedback",
//                        description: "Displays current speed feedback to drivers, sometimes with an advisory plaque.",
//                        images: ["W13-20", "W13-20aP"],
//                        wrongAnswers: ["Speed Advisory", "Exit Speed Advisory", "Ramp Speed Advisory", "Lane Ends", "Bump", "Low Clearance", "Divided Highway Begins"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    TrafficSign(
//                        title: "Dead End",
//                        description: "Indicates that the road ends ahead and there is no through passage.",
//                        images: ["W14-1", "W14-1aR", "W14-1aL"],
//                        wrongAnswers: ["No Outlet", "No Passing Zone", "Playground", "Lane Ends", "Stop", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    TrafficSign(
//                        title: "No Outlet",
//                        description: "Indicates that the road has no exit or through passage for vehicles.",
//                        images: ["W14-2", "W14-2aR", "W14-2aL"],
//                        wrongAnswers: ["Dead End", "No Passing Zone", "Playground", "Lane Ends", "Stop", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    TrafficSign(
//                        title: "No Passing Zone",
//                        description: "Warns drivers that passing other vehicles is prohibited in this section of roadway.",
//                        images: ["W14-3"],
//                        wrongAnswers: ["Dead End", "No Outlet", "Playground", "Lane Ends", "Stop", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Playground",
//                        description: "Warns drivers of areas where children may be present and to exercise caution.",
//                        images: ["W15-1"],
//                        wrongAnswers: ["Dead End", "No Outlet", "No Passing Zone", "Lane Ends", "Stop", "Yield"],
//                        sectionName: "Warning Signs",
//                        subSectionName: "General Warnings"
//                    )
//                ]
//            )
//        ],
//        signs: []
//    )
//    
//    
//    static let guideSigns = TrafficSection(
//        index: 2,
//        name: "Guide Signs",
//        description: "Signs that identify highways, roads, or specific routes, including route numbers, directions, and special route designations.",
//        subSections: [
////            Route Marker Signs
//            TrafficSubSection(
//                index: 0,
//                name: "Route Marker Signs",
//                description: """
//Displays numbered route shields that identify highways, interstates, and other major routes. These signs help drivers confirm their current route and ensure they remain on the correct roadway while traveling.
//""",
//                signs: [
//                    
//                    TrafficSign(
//                        title: "Interstate Route Marker",
//                        description: "Indicates the number of the interstate highway, 2 or 3 digits, optionally with state designation.",
//                        images: ["M1-1", "M1-1a", "M1-1b", "M1-1c"],
//                        wrongAnswers: ["No U-Turn", "Speed Limit", "Pedestrian Crossing", "Deer Crossing", "Yield"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Off Interstate Business Route Marker",
//                        description: "Indicates a business route off an interstate highway, either loop or spur, 2 or 3 digits.",
//                        images: ["M1-2", "M1-3", "M1-2a", "M1-3a"],
//                        wrongAnswers: ["Hospital Ahead", "One Way", "Rest Area", "Do Not Pass", "Merge Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "US Route Marker",
//                        description: "Indicates the number of the US highway, either 2 or 3 digits.",
//                        images: ["M1-4", "M1-4a"],
//                        wrongAnswers: ["Stop Ahead", "Slippery When Wet", "No Left Turn", "Crossroad Ahead", "Narrow Bridge"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "State Route Marker",
//                        description: "Indicates the number of the state highway, either 2 or 3 digits.",
//                        images: ["M1-5", "M1-5a"],
//                        wrongAnswers: ["Road Narrows", "Curve Ahead", "School Zone", "End Construction", "No Parking"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "County Route Marker",
//                        description: "Indicates the number of the county road.",
//                        images: ["M1-6"],
//                        wrongAnswers: ["Stop", "Yield", "Slippery When Wet", "Detour", "Deer Crossing"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Forest Route",
//                        description: "Indicates a numbered forest route within national or state forest lands.",
//                        images: ["M1-7"],
//                        wrongAnswers: ["Narrow Bridge", "Curve Ahead", "Falling Rocks", "Truck Crossing", "No Outlet"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Bicycle Route",
//                        description: "Marks a designated bicycle route, including numbered or non-numbered state, local, or U.S. routes. Signs may display route numbers or text and indicate the path for cyclists.",
//                        images: ["M1-8", "M1-8a", "M1-8b", "M1-8c", "M1-9"],
//                        wrongAnswers: [
//                            "Slippery When Wet",
//                            "Stop Ahead",
//                            "Merge Left",
//                            "Pedestrian Crossing",
//                            "No Passing Zone",
//                            "Truck Route",
//                            "Roundabout Ahead",
//                            "Steep Hill",
//                            "Deer Crossing"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Eisenhower Interstate System",
//                        description: "Designates highways that are part of the Eisenhower Interstate System.",
//                        images: ["M1-10", "M1-10a"],
//                        wrongAnswers: ["Yield", "School Zone", "Hospital", "Curve Ahead", "Bridge Ices Before Road"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Junction",
//                        description: "Indicates an upcoming junction or intersection. Can be displayed as a plaque or a combination of route signs.",
//                        images: ["M2-1P", "M2-2"],
//                        wrongAnswers: ["Stop", "No Parking", "Dead End", "Narrow Bridge", "Curve Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Cardinal Direction",
//                        description: "Plaques indicating the cardinal direction of the route (North, East, South, West).",
//                        images: ["M3-1P", "M3-2P", "M3-3P", "M3-4P"],
//                        wrongAnswers: ["No Outlet", "Steep Hill", "Slippery When Wet", "Detour", "Merge Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Route Plaque",
//                        description: "Plaques providing route information such as Alternate, Business, By-Pass, Truck, To, End, Temporary, and Detour.",
//                        images: ["M4-1P", "M4-1aP", "M4-2P", "M4-3P", "M4-4P", "M4-5P", "M4-6P", "M4-7P", "M4-7aP", "M4-14P"],
//                        wrongAnswers: ["Pedestrian Crossing", "Sharp Curve", "Deer Crossing", "Stop Ahead", "Hospital"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Routes",
//                        description: "Signs and plaques indicating the start, continuation, or end of an emergency route.",
//                        images: ["M4-11", "M4-11a", "M4-11bP", "M4-11cP", "M4-12"],
//                        wrongAnswers: ["Hospital Ahead", "Curve Ahead", "No Passing Zone", "Rest Area", "Stop Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Toll and Payment Panel",
//                        description: "Panels indicating toll collection points or exact change requirements.",
//                        images: ["M4-17", "M4-18"],
//                        wrongAnswers: ["No Parking", "Stop", "Dead End", "Bridge Out", "Yield"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Advance Turn Arrows",
//                        description: "Indicates the direction of upcoming turns, showing advance right or left turns at 90°, 45°, or circular intersections.",
//                        images: ["M5-1PR", "M5-1PL", "M5-2PR", "M5-2PL", "M5-3PR", "M5-3PL"],
//                        wrongAnswers: ["No U-Turn", "Pedestrian Crossing", "Curve Ahead", "Stop", "Roundabout Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Lane Designation Plaque",
//                        description: "Indicates which lane drivers should use for left, center, or right movements ahead.",
//                        images: ["M5-4P", "M5-5P", "M5-6P"],
//                        wrongAnswers: ["Stop Ahead", "Merging Traffic", "Curve Ahead", "No Parking", "Deer Crossing"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Directional Arrow",
//                        description: "Shows permitted directions of travel using arrows that may point right, left, diagonal, or straight ahead.",
//                        images: ["M6-1PR", "M6-1PL", "M6-2PR", "M6-2PL", "M6-2aPR", "M6-2aPL", "M6-3P"],
//                        wrongAnswers: ["Yield", "Stop", "Do Not Enter", "Curve Ahead", "No U-Turn"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Combination Directional Arrows",
//                        description: "Indicates multiple possible movements from a lane, such as straight and right or straight and diagonal turns.",
//                        images: ["M6-4P", "M6-5PR", "M6-5PL", "M6-6PR", "M6-6PL", "M6-7PR", "M6-7PL"],
//                        wrongAnswers: ["Stop", "Yield", "No Left Turn", "Deer Crossing", "Bridge Ices Before Road"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Route Marker Signs"
//                    )
//                ]
//            ),
////            Destination Signs
//            TrafficSubSection(
//                index: 1,
//                name: "Destination Signs",
//                description: """
//Guide signs that provide directional, distance, and destination information to help drivers navigate toward cities, highways, and major locations. They include destination, distance, and direction markers.
//""",
//                signs: [
//                    TrafficSign(
//                        title: "Destination",
//                        description: "Indicates a destination ahead. May appear in one-, two-, or three-line formats to show place names.",
//                        images: ["D1-1", "D1-2", "D1-3", "D1-1d", "D1-2d", "D1-3d"],
//                        wrongAnswers: [
//                            "Exit Sign",
//                            "Route Shield",
//                            "Rest Area",
//                            "Mile Marker",
//                            "Detour Sign",
//                            "Distance Plaque",
//                            "Parking Direction"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Destination and Distance",
//                        description: "Displays the destination name and the distance to it — used to help drivers gauge remaining travel distance.",
//                        images: ["D1-1a", "D1-2a", "D1-3a", "D1-1e"],
//                        wrongAnswers: [
//                            "Route Shield",
//                            "Exit Ahead",
//                            "Mile Marker",
//                            "Detour Sign",
//                            "Rest Area",
//                            "Guide Plaque"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Destination",
//                        description: "Indicates destinations for bicycle routes; often used on signed bike networks and may show distances.",
//                        images: ["D1-1b", "D1-2b", "D1-3b", "D1-1c", "D1-2c", "D1-3c"],
//                        wrongAnswers: [
//                            "Pedestrian Route",
//                            "Bicycle Lane Marker",
//                            "Route Shield",
//                            "Detour for Bicycles",
//                            "Trail Crossing",
//                            "Bicycle Parking",
//                            "Mile Marker"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Circular Intersection Destination (Diagrammatic)",
//                        description: "Diagrammatic sign showing destination routing through a circular intersection, used to guide drivers through roundabouts.",
//                        images: ["D1-5", "D1-5a"],
//                        wrongAnswers: [
//                            "Roundabout Ahead Warning",
//                            "Exit Sign",
//                            "Route Shield",
//                            "Lane Control Diagram",
//                            "Detour Sign",
//                            "Destination and Distance",
//                            "Traffic Pattern Change"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Distance",
//                        description: "Displays the distance to destinations for vehicles. May appear in one-, two-, or three-line formats.",
//                        images: ["D2-1", "D2-2", "D2-3"],
//                        wrongAnswers: [
//                            "Route Shield",
//                            "Detour Sign",
//                            "Exit Sign",
//                            "Guide Plaque",
//                            "Mile Marker"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Distance",
//                        description: "Displays the distance to destinations specifically for bicycle routes. May appear in one-, two-, or three-line formats.",
//                        images: ["D2-1a", "D2-2a", "D2-3a"],
//                        wrongAnswers: [
//                            "Route Shield",
//                            "Detour Sign",
//                            "Exit Sign",
//                            "Guide Plaque",
//                            "Mile Marker"
//                        ],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Street Name",
//                        description: "Displays the name of a street. May appear in one to four lines and can include route shields.",
//                        images: ["D3-1", "D3-1a", "D3-2", "D3-2a", "D3-2b", "D3-2c"],
//                        wrongAnswers: ["Destination Sign", "Distance Sign", "Exit Sign", "Detour Sign", "Route Marker"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Facilities",
//                        description: "Indicates areas for bicycle parking, bicycle-sharing stations, or bicycle lockers.",
//                        images: ["D4-3", "D4-4", "D4-4a"],
//                        wrongAnswers: ["Street Name", "Route Marker", "Destination Sign", "Distance Sign", "Trail Crossing"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Rest Area",
//                        description: "Indicates rest areas ahead. May include distance, next exit, or directional arrows.",
//                        images: ["D5-1", "D5-1a", "D5-2", "D5-2a", "D5-5", "D5-6"],
//                        wrongAnswers: ["Parking Area", "Picnic Area", "Scenic Area", "Brake Check", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Rest Area with Tourist Info",
//                        description: "Indicates rest areas that include tourist information. Can include distance, next right, or diagonal right arrow.",
//                        images: ["D5-7", "D5-7a", "D5-8"],
//                        wrongAnswers: ["Regular Rest Area", "Parking Area", "Scenic Area", "Picnic Area", "Brake Check", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Parking Area",
//                        description: "Indicates general parking areas or park-and-ride lots ahead. May include versions showing distance, direction, or arrow panels such as diagonal or gore signs.",
//                        images: ["D4-1", "D4-2", "D5-9", "D5-9a", "D5-9b"],
//                        wrongAnswers: ["Rest Area", "Picnic Area", "Scenic Area", "Brake Check", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Picnic Area",
//                        description: "Indicates picnic areas ahead. Can include distance, diagonal right arrow, or gore sign.",
//                        images: ["D5-10", "D5-10a", "D5-10b"],
//                        wrongAnswers: ["Rest Area", "Parking Area", "Scenic Area", "Brake Check", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Scenic Area",
//                        description: "Indicates scenic viewpoints or areas ahead. Can show distance, diagonal right arrow, or gore sign.",
//                        images: ["D5-11", "D5-11a", "D5-11b"],
//                        wrongAnswers: ["Rest Area", "Parking Area", "Picnic Area", "Brake Check", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Interstate Oasis",
//                        description: "Marks locations of Interstate Oasis facilities. Can include plaques for additional info.",
//                        images: ["D5-12", "D5-12aP", "D5-12b"],
//                        wrongAnswers: ["Rest Area", "Parking Area", "Picnic Area", "Scenic Area", "Brake Check", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Brake Check Area",
//                        description: "Indicates areas where drivers can check vehicle brakes. Can include distance or diagonal right arrow.",
//                        images: ["D5-13", "D5-14"],
//                        wrongAnswers: ["Chain-Up Area", "Rest Area", "Parking Area", "Scenic Area", "Picnic Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Chain-Up Area",
//                        description: "Indicates areas for installing tire chains. Can include distance or diagonal right arrow.",
//                        images: ["D5-15", "D5-16"],
//                        wrongAnswers: ["Brake Check Area", "Rest Area", "Parking Area", "Scenic Area", "Picnic Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Weigh Station",
//                        description: "Indicates locations of weigh stations ahead, including distance, next exit, or directional arrow.",
//                        images: ["D8-1", "D8-1a", "D8-2", "D8-3"],
//                        wrongAnswers: ["Rest Area", "Parking Area", "Picnic Area", "Scenic Area", "Brake Check Area", "Chain-Up Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Reference Location",
//                        description: "Indicates reference locations along highways, including intermediate or enhanced markers, with 1, 2, or 3 digits.",
//                        images: ["D10-1", "D10-1a", "D10-2", "D10-2a", "D10-3", "D10-3a", "D10-4", "D10-5"],
//                        wrongAnswers: ["Weigh Station", "Rest Area", "Distance Sign", "Destination Sign", "Parking Area", "Picnic Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Route",
//                        description: "Indicates bike routes, including plaques and routes with destination information.",
//                        images: ["D11-1", "D11-1bP", "D11-1c"],
//                        wrongAnswers: ["Shared-Use Path", "Pedestrian Route", "Skater Route", "Destination Sign", "Distance Sign"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Shared-Use Path Destination",
//                        description: "Indicates destinations along shared-use paths for bicycles and pedestrians, with 1-, 2-, or 3-line formats and optional distance information.",
//                        images: ["D11-10a", "D11-10b", "D11-10c", "D11-10d", "D11-10e", "D11-10f"],
//                        wrongAnswers: ["Bicycle Route", "Pedestrian Route", "Skater Route", "Destination Sign", "Distance Sign"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Permitted Users",
//                        description: "Indicates which users are permitted on a path or lane, including bicycles, pedestrians, skaters, and equestrians.",
//                        images: ["D11-11", "D11-12", "D11-13", "D11-14"],
//                        wrongAnswers: ["Bicycle Route", "Shared-Use Path Destination", "Destination Sign", "Distance Sign", "Parking Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Bicycle Left Turn Box",
//                        description: "Indicates that bicycles may use a dedicated left turn box or lane for turning movements.",
//                        images: ["D11-20L", "D11-20aL"],
//                        wrongAnswers: ["Shared-Use Path", "Pedestrian Route", "Skater Route", "Bicycle Route", "Destination Sign"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Travel Information",
//                        description: "Signs providing radio, traffic, weather, carpool, emergency, and roadside assistance information.",
//                        images: ["D12-1", "D12-1a", "D12-1bP", "D12-2", "D12-3", "D12-4", "D12-5", "D12-5a", "D12-6"],
//                        wrongAnswers: ["Destination Sign", "Distance Sign", "Bicycle Route", "Street Name", "Parking Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Crossover / Freeway Entrance",
//                        description: "Signs indicating crossovers and freeway entrance locations, including distance information.",
//                        images: ["D13-1", "D13-2", "D13-3", "D13-3a"],
//                        wrongAnswers: ["Destination Sign", "Distance Sign", "Lane Control Diagram", "Exit Sign", "Route Shield"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Combination Lane Use / Destination",
//                        description: "Indicates lane use combined with destination guidance, including route shields or street names.",
//                        images: ["D15-1", "D15-1a"],
//                        wrongAnswers: ["Street Name", "Destination Sign", "Distance Sign", "Route Plaque", "Advance Arrow"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                    TrafficSign(
//                        title: "Truck Lane / Slow Vehicle",
//                        description: "Indicates upcoming truck lanes, passing lanes, and emergency or slow vehicle turn-outs, with distance and arrow information.",
//                        images: ["D17-1", "D17-2", "D17-3", "D17-4", "D17-5", "D17-6", "D17-7"],
//                        wrongAnswers: ["Destination Sign", "Distance Sign", "Lane Control Diagram", "Exit Sign", "Advance Turn Arrow"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Destination Signs"
//                    ),
//                ]
//            ),
//            //            Motorist Services
//            TrafficSubSection(
//                index: 2,
//                name: "Motorist Services",
//                description: "Signs indicating available services such as gas stations, food, lodging, hospitals, and other motorist facilities.",
//                signs: [
//                    // Motorist Services Signs
//                    TrafficSign(
//                        title: "Telephone",
//                        description: "Indicates the presence of a public telephone or phone service ahead.",
//                        images: ["D9-1"],
//                        wrongAnswers: ["Hospital", "Gasoline", "Camping", "Parking Area", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Hospital",
//                        description: "Indicates the location of a hospital or medical facility.",
//                        images: ["D9-2", "D9-13aP"],
//                        wrongAnswers: ["Telephone", "Gasoline", "Camping", "Parking Area", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Camping",
//                        description: "Indicates a campground or camping area is ahead.",
//                        images: ["D9-3"],
//                        wrongAnswers: ["Telephone", "Hospital", "Gasoline", "Food", "Lodging", "Parking Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Litter Container",
//                        description: "Indicates a location where litter should be disposed of.",
//                        images: ["D9-4"],
//                        wrongAnswers: ["Telephone", "Hospital", "Gasoline", "Food", "Lodging", "Parking Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Handicapped Accessible",
//                        description: "Indicates facilities or areas accessible to individuals with disabilities.",
//                        images: ["D9-6", "D9-6P"],
//                        wrongAnswers: ["Parking Area", "Gasoline", "Hospital", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Gasoline",
//                        description: "Indicates a gasoline or fuel station ahead.",
//                        images: ["D9-7"],
//                        wrongAnswers: ["Telephone", "Hospital", "Camping", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Food",
//                        description: "Indicates a restaurant or food service area ahead.",
//                        images: ["D9-8"],
//                        wrongAnswers: ["Telephone", "Hospital", "Camping", "Gasoline", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Lodging",
//                        description: "Indicates available lodging such as hotels or motels.",
//                        images: ["D9-9"],
//                        wrongAnswers: ["Telephone", "Hospital", "Camping", "Gasoline", "Food"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Tourist Information",
//                        description: "Indicates the location of a tourist information center.",
//                        images: ["D9-10"],
//                        wrongAnswers: ["Telephone", "Hospital", "Camping", "Gasoline", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Alternative Fuels",
//                        description: "Indicates the availability of diesel or alternative fuels, including compressed natural gas (CNG), ethanol, liquefied natural gas (LNG), liquefied petroleum gas (LPG), hydrogen, and biofuel.",
//                        images: ["D9-11", "D9-11a", "D9-11c", "D9-11d", "D9-11e", "D9-11f", "D9-11g"],
//                        wrongAnswers: ["Camping", "Telephone", "Hospital", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Electric Vehicle Charging",
//                        description: "Indicates the presence of an electric vehicle charging station or related facility.",
//                        images: ["D9-11b", "D9-11bP"],
//                        wrongAnswers: ["Gasoline", "Diesel Fuel", "Rest Area", "Tourist Information"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "RV Sanitary Station",
//                        description: "Indicates a location for recreational vehicle sanitary facilities.",
//                        images: ["D9-12"],
//                        wrongAnswers: ["Gasoline", "Telephone", "Hospital", "Camping", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Emergency Medical Services",
//                        description: "Indicates emergency medical services, including ambulance stations and trauma centers.",
//                        images: ["D9-13", "D9-13bP", "D9-13cP", "D9-13dP"],
//                        wrongAnswers: ["Litter Container", "Telephone", "Gasoline", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Police",
//                        description: "Indicates a police station or law enforcement services ahead.",
//                        images: ["D9-14"],
//                        wrongAnswers: ["Hospital", "Telephone", "Gasoline", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Truck Parking",
//                        description: "Indicates truck parking, external power, and availability at exits, distances, rest areas, or combined locations.",
//                        images: ["D9-16", "D9-16aP", "D9-16b", "D9-16c", "D9-16d", "D9-16e"],
//                        wrongAnswers: ["Parking Area", "Gasoline", "Rest Area", "Food", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Next Services",
//                        description: "Provides information on upcoming services, including electric vehicle charging stations.",
//                        images: ["D9-17P", "D9-17a"],
//                        wrongAnswers: ["Rest Area", "Parking Area", "Food", "Gasoline", "Lodging"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "General Services",
//                        description: "Indicates up to six services at an exit or action message, including rural interchange variants.",
//                        images: ["D9-18", "D9-18b", "D9-18c", "D9-18dP", "D9-18eP", "D9-18fP"],
//                        wrongAnswers: ["Rest Area", "Parking Area", "Electric Vehicle Charging", "Hospital"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Alternative Fuels Corridor",
//                        description: "Indicates a designated corridor with alternative fuel availability.",
//                        images: ["D9-19"],
//                        wrongAnswers: ["Diesel Fuel", "Gasoline", "Electric Vehicle Charging", "Parking Area", "Rest Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Pharmacy",
//                        description: "Indicates a pharmacy with optional 24-hour service.",
//                        images: ["D9-20"],
//                        wrongAnswers: ["Hospital", "Food", "Lodging", "Gasoline", "Rest Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Telecommunication",
//                        description: "Indicates availability of telecommunication services for the hearing impaired, such as TDD or TTY devices.",
//                        images: ["D9-21"],
//                        wrongAnswers: ["Wireless Internet", "Tourist Information", "Hospital", "Gasoline", "Food"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                    TrafficSign(
//                        title: "Wireless Internet",
//                        description: "Indicates availability of wireless internet service in the area, often at rest areas or public facilities.",
//                        images: ["D9-22"],
//                        wrongAnswers: ["Telecommunication (TDD/TTY)", "Tourist Information", "Gasoline", "Lodging", "Rest Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Motorist Services"
//                    ),
//                ]
//            ),
//            //            General Information
//            TrafficSubSection(
//                index: 3,
//                name: "General Information",
//                description: """
//Signs providing general public information such as state borders, facilities, transportation hubs, and project or corridor designations. They help orient drivers and convey civic, geographic, or emergency details.
//""",
//                signs: [
//                    TrafficSign(
//                        title: "Traffic Signal Speed",
//                        description: "Indicates the appropriate speed for signal progression through coordinated traffic lights.",
//                        images: ["I1-1"],
//                        wrongAnswers: ["Speed Limit", "Work Zone Speed", "School Zone Speed", "Ramp Speed", "Truck Speed"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "State Line",
//                        description: "Marks the boundary line between two states.",
//                        images: ["I2-1"],
//                        wrongAnswers: ["County Line", "City Limit", "Welcome Center", "Rest Area", "Scenic Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "River Crossing",
//                        description: "Identifies the name of a river or waterway being crossed.",
//                        images: ["I2-2"],
//                        wrongAnswers: ["Bridge Ahead", "Flood Zone", "Scenic Area", "Stream Warning", "Marina"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Grade Separation Identification",
//                        description: "Displays the name of an overpass, underpass, or bridge structure for identification purposes.",
//                        images: ["I2-3", "I2-3a", "I2-3b", "I2-3c"],
//                        wrongAnswers: ["State Line", "Rest Area", "Exit Number", "Highway Marker", "Weight Limit"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Future Interstate Corridor",
//                        description: "Marks a corridor designated for future interstate development or construction.",
//                        images: ["I2-4", "I2-4a"],
//                        wrongAnswers: ["Detour Route", "Construction Ahead", "Truck Route", "Emergency Route", "Alternate Route"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Project Information",
//                        description: "Displays details about ongoing or completed highway projects, often showing project names or funding information.",
//                        images: ["I2-5", "I2-5a"],
//                        wrongAnswers: ["Detour Sign", "Construction Zone", "Future Corridor", "Route Marker", "Rest Area"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Transportation Facilities",
//                        description: "Indicates nearby transportation hubs such as airports, bus, train, or ferry terminals.",
//                        images: ["I3-5", "I3-6", "I3-7", "I3-8", "I3-9", "I3-10", "I3-10P"],
//                        wrongAnswers: ["Parking", "Rest Area", "Scenic Area", "Carpool", "Tourist Info"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Community Facilities",
//                        description: "Provides direction or identification for civic facilities such as libraries or recycling centers.",
//                        images: ["I4-1", "I4-2"],
//                        wrongAnswers: ["Rest Area", "Tourist Info", "Hospital", "School", "City Center"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Emergency Notification / Exit Instructions",
//                        description: "Provides information for emergency communication or exit procedures at specific locations.",
//                        images: ["I13-1", "I13-2"],
//                        wrongAnswers: ["Hospital", "Fire Station", "Police", "Evacuation Route", "Call 911"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    ),
//                    TrafficSign(
//                        title: "Acknowledgement Signs",
//                        description: "Displays acknowledgements or dedications such as rest areas, welcome centers, or project sponsors.",
//                        images: ["I20-1", "I20-2", "I20-3", "I20-4", "I20-4a", "I20-5P"],
//                        wrongAnswers: ["Rest Area", "Tourist Info", "Scenic Area", "Future Corridor", "Welcome Sign"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "General Information"
//                    )
//                ]
//            ),
////            Freeway and Expressway Signs
//            TrafficSubSection(
//                index: 4,
//                name: "Freeway and Expressway",
//                description: """
//Signs that provide guidance, regulation, or information specific to freeway and expressway driving. These include entry and exit directions, lane assignments, merging instructions, and other high-speed roadway controls.
//""",
//                signs: [
//                    TrafficSign(
//                        title: "Interchange Advance Guide",
//                        description: "Provides advance guidance for upcoming interchanges, showing one, two, or three destinations.",
//                        images: ["E1-1", "E1-2", "E1-3"],
//                        wrongAnswers: ["Welcome Sign", "Service Area", "Mile Marker", "Route Marker", "Traffic Signal Ahead", "Stop Sign", "Construction Warning"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    TrafficSign(
//                        title: "Exit Direction / Information",
//                        description: "Plaques indicating the exit number with variations for digits, suffix letters, and left/right placement.",
//                        images: ["E1-5P","E1-5aP","E1-5bP","E1-5cP","E1-5dP","E1-5eP","E1-5fP","E1-5gP","E1-5hP","E1-5iP","E1-5jP","E1-5kP","E1-5mP"],
//                        wrongAnswers: ["Route Shield", "Speed Limit", "Detour Sign", "School Zone", "Railroad Crossing"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    TrafficSign(
//                        title: "Specific Services Sign",
//                        description: "Indicates specific services available at an interchange or rest area.",
//                        images: ["j2-1"],
//                        wrongAnswers: ["Exit Plaque", "Lane Designation", "Traffic Signal", "Guide Marker", "Speed Advisory", "Toll Booth", "Pedestrian Crossing"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    TrafficSign(
//                        title: "Next Exit Plaque",
//                        description: "Displays the next exit information in one or two lines.",
//                        images: ["E2-1P","E2-1aP"],
//                        wrongAnswers: ["Service Area Sign", "Destination Sign", "Mile Marker", "Speed Limit", "Lane Control", "Construction", "School Crossing"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    TrafficSign(
//                        title: "Exit Direction",
//                        description: "Indicates the direction of the exit for one, two, or three destinations.",
//                        images: ["E4-1","E4-2","E4-3"],
//                        wrongAnswers: ["Advance Guide Sign", "Welcome Sign", "Mile Marker", "Traffic Signal", "Stop Ahead", "Detour Sign", "Lane Ends"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Exit Gore",
//                        description: "Marks the gore area of exits, with or without exit numbers, indicating open/closed lanes and narrow gore situations.",
//                        images: ["E5-1","E5-1a","E5-1bP","E5-1c"],
//                        wrongAnswers: ["Speed Limit", "Stop Sign", "Traffic Signal", "Lane Ends", "Pedestrian Crossing", "Yield", "Curve Warning"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Pull-Through",
//                        description: "Indicates pull-through lanes and destinations within freeway interchanges.",
//                        images: ["E6-1","E6-1a"],
//                        wrongAnswers: ["Exit Gore", "Detour Sign", "Lane Shift", "Stop Ahead", "Destination Sign", "School Zone", "Construction Warning"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Post-Interchange Distance / Travel Time",
//                        description: "Displays distance and estimated travel time following a freeway interchange.",
//                        images: ["E7-3","E7-4","E7-5","E7-6"],
//                        wrongAnswers: ["Next Exit Plaque", "Route Marker", "Speed Advisory", "School Zone", "Lane Control", "Stop Sign", "Yield Sign"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Preferential Lane",
//                        description: "Indicates entrance, exit, or intermediate egress for preferential lanes including overhead and post-mounted signs.",
//                        images: ["E8-1","E8-1a","E8-2","E8-2a","E8-3","E8-4","E8-5","E8-6"],
//                        wrongAnswers: ["Exit Gore","Next Exit Plaque","Lane Ends","Detour Sign","School Crossing","Traffic Signal","Curve Warning"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Exit Only Panels",
//                        description: "Panels used for exit-only lanes, showing arrows and combinations of 'Exit' and 'Only' messages.",
//                        images: ["E11-1","E11-1a","E11-1b","E11-1c","E11-1d","E11-1e","E11-1f"],
//                        wrongAnswers: ["Directional Arrow","Speed Advisory","Detour Sign","School Zone","Traffic Signal","Mile Marker"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Exit Advisory Speed",
//                        description: "Panels displaying advisory speeds for exits or ramps.",
//                        images: ["E13-2a", "E13-2b"],
//                        wrongAnswers: ["Lane Control","Pull-Through","School Zone","Stop Sign","Curve Warning"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Freeway and Expressway"
//                    )
//                ]
//            ),
////            Emergency Management Signs
//            TrafficSubSection(
//                index: 5,
//                name: "Emergency Management",
//                description: """
//Includes guide and regulatory signs used during emergency situations such as evacuations, detours, or incident management. These signs provide clear directions to drivers during disasters, road closures, or hazardous conditions, ensuring safe and orderly traffic flow.
//""",
//                signs: [
//                    TrafficSign(
//                        title: "Evacuation Route",
//                        description: "Indicates the designated evacuation route to be followed during emergencies such as natural disasters or hazardous events.",
//                        images: ["EM1-1", "EM1-1a", "EM1-2"],
//                        wrongAnswers: ["Detour Route", "Alternate Route", "Hospital", "Emergency Shelter", "Work Zone Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Area Closed",
//                        description: "Indicates that the road or area is closed to all traffic due to an emergency or hazardous condition.",
//                        images: ["EM2-1"],
//                        wrongAnswers: ["Road Closed Ahead", "Detour Ahead", "Traffic Control Point", "Evacuation Route", "Work Zone Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Traffic Control Point",
//                        description: "Used to identify an official traffic control point operated by authorities during emergencies or evacuations.",
//                        images: ["EM2-2"],
//                        wrongAnswers: ["Area Closed", "Detour Ahead", "Evacuation Route", "Emergency Shelter", "Checkpoint Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Maintain Top Safe Speed",
//                        description: "Advises drivers to maintain a safe and steady speed through emergency or controlled areas.",
//                        images: ["EM2-3"],
//                        wrongAnswers: ["Speed Limit", "Slow Down", "End Road Work", "Evacuation Route", "Traffic Control Point"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Road Use Permit Required",
//                        description: "Indicates that only vehicles with authorized permits may continue on the road during restricted or emergency conditions.",
//                        images: ["EM2-4"],
//                        wrongAnswers: ["Area Closed", "Traffic Control Point", "Evacuation Route", "Authorized Vehicles Only", "Check Station Ahead"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Services Centers",
//                        description: "Directs traffic to designated emergency facilities such as medical, welfare, registration, or decontamination centers.",
//                        images: ["EM3-1", "EM3-1a", "EM3-1b", "EM3-1c"],
//                        wrongAnswers: ["Hospital", "Evacuation Route", "Rest Area", "Police Station"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Emergency Shelter",
//                        description: "Directs evacuees to nearby shelters, including hurricane, fallout, or chemical shelters, depending on the nature of the emergency.",
//                        images: ["EM4-1", "EM4-1a", "EM4-1b", "EM4-1c"],
//                        wrongAnswers: ["Evacuation Route", "Medical Center", "Rest Area", "Police Station", "Information Center"],
//                        sectionName: "Guide Signs",
//                        subSectionName: "Emergency Management"
//                    )
//                ]
//            )
//        ],
//        signs: []
//    )
//    
//    static let temporaryTrafficControlSigns = TrafficSection(
//        index: 3,
//        name: "Temporary Traffic Control Signs",
//        description: "Signs used to guide, warn, and regulate road users through temporary traffic control zones such as construction, maintenance, or incident areas. These signs are typically orange and alert drivers to changes in road conditions or patterns.",
//        subSections: [
//            TrafficSubSection(
//                index: 0,
//                name: "Regulatory Signs",
//                description: "Includes temporary regulatory signs used in work zones to control driver behavior — such as stop/go operations, lane usage, pedestrian and bicycle guidance, and safety restrictions.",
//                signs: [
//                    TrafficSign(
//                        title: "Wait on Stop",
//                        description: "Used in temporary traffic control zones to instruct drivers to remain stopped until directed to proceed. Commonly used with flagger or pilot car operations.",
//                        images: ["R1-7"],
//                        wrongAnswers: ["Stop Ahead", "Yield", "Go on Slow", "Do Not Enter", "Road Work Ahead", "One Lane Road"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Wait on Stop / Go on Slow",
//                        description: "Used in alternating one-lane traffic areas to indicate that drivers must wait on a STOP signal and may proceed when the sign shows SLOW.",
//                        images: ["R1-7a"],
//                        wrongAnswers: ["Yield", "Stop Ahead", "Road Work Ahead", "End Road Work", "Detour Ahead", "Do Not Enter"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Go on Slow",
//                        description: "Indicates drivers may proceed slowly through the work zone or single-lane section as directed by a flagger or signal.",
//                        images: ["R1-8"],
//                        wrongAnswers: ["Stop Ahead", "Yield", "Road Work Ahead", "Detour", "Flagger Ahead", "End Road Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "End Work Zone Speed Limit",
//                        description: "Indicates the end of a reduced speed zone in a work area. Drivers should resume normal speed limits beyond this point.",
//                        images: ["R2-12"],
//                        wrongAnswers: ["Work Zone Ahead", "Truck Speed Limit", "Yield", "Stop", "Citywide", "Fines Higher", "Residential"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Stay in Lane to Merge Point",
//                        description: "Instructs drivers to remain in their lane until reaching the designated merge point in a work zone. Used to improve traffic flow and reduce early merging.",
//                        images: ["R4-9a"],
//                        wrongAnswers: ["Merge Left", "Merge Right", "Lane Ends", "Detour Ahead", "Keep Left", "Road Work Ahead", "Use Next Lane"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Pedestrian Crosswalk",
//                        description: "Indicates a designated pedestrian crossing area within or near a temporary traffic control zone. Alerts drivers to yield to pedestrians in crosswalks.",
//                        images: ["R9-8"],
//                        wrongAnswers: ["Pedestrian Detour", "Sidewalk Closed", "Flagger Ahead", "Work Zone Ahead", "Stop Here on Red", "Yield Ahead", "Crosswalk Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Sidewalk Closed / Pedestrian Detour",
//                        description: "Indicates sidewalk closures and instructions for pedestrians to cross or use alternative paths.",
//                        images: ["R9-9", "R9-10", "R9-11", "R9-11a"],
//                        wrongAnswers: ["Bicycles Use Shoulder Only", "No Skaters", "Keep Right", "Do Not Pass", "Lane-Assisted Guidance", "Stop", "Bicycle All Turns"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Bike Lane Closed",
//                        description: "Indicates that the bicycle lane ahead is closed due to construction or maintenance. Cyclists should merge with traffic or follow a detour.",
//                        images: ["R9-12"],
//                        wrongAnswers: ["Pedestrian Detour", "Sidewalk Closed", "Merge Left", "Bike Route", "Work Zone Ahead", "Narrow Bridge", "End Bike Lane"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    ),
//                    TrafficSign(
//                        title: "Turn Off 2-Way Radios and Cell Phones",
//                        description: "Advises drivers to turn off two-way radios and cell phones in areas where radio signals could interfere with blasting or sensitive equipment, such as construction or tunnel zones.",
//                        images: ["R22-2"],
//                        wrongAnswers: ["No Idling", "Stop Here on Red", "Work Zone Ahead", "Detour", "Road Work Next 5 Miles", "Flagger Ahead", "End Road Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Regulatory Signs"
//                    )
//                ]
//            ),
//            TrafficSubSection(
//                index: 1,
//                name: "Work Zone Signs",
//                description: "Warn drivers of construction, maintenance, and utility operations ahead. These orange signs communicate lane closures, detours, flagger control, and work activity areas where caution and reduced speed are required.",
//                signs: [
//                    TrafficSign(
//                        title: "Work Ahead",
//                        description: "Warns drivers, pedestrians, and cyclists of upcoming construction or maintenance. Drivers should watch for lane changes or closures, and pedestrians or cyclists should be aware of path or sidewalk work.",
//                        images: ["CW20-1", "CW20-1b"],
//                        wrongAnswers: ["Detour Ahead", "Lane Ends", "Flagger Ahead", "End Road Work", "Utility Work Ahead", "Workers Ahead", "Sidewalk Closed", "Bike Lane Closed", "Pedestrian Crossing", "Work Zone Ahead", "Trail Detour", "End Path Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Detour Ahead",
//                        description: "Warns that a detour is ahead due to road closure or construction. Variants include bicycle detour signs for temporary rerouting of bike traffic.",
//                        images: ["CW20-2", "CW20-2a"],
//                        wrongAnswers: ["Road Work Ahead", "Lane Ends", "Merge Left", "Flagger Ahead", "End Road Work", "Right Lane Closed Ahead", "Trail Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Road Closed Ahead",
//                        description: "Warns drivers that the road ahead is closed to through traffic due to work activities.",
//                        images: ["CW20-3"],
//                        wrongAnswers: ["Detour Ahead", "End Road Work", "Road Work Ahead", "Flagger Ahead", "Use Next Exit", "One Lane Road Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Path Closed Ahead",
//                        description: "Informs pedestrians or cyclists that a path or sidewalk ahead is closed and an alternate route must be used.",
//                        images: ["CW20-3a"],
//                        wrongAnswers: ["Sidewalk Closed", "Bike Lane Closed", "Trail Detour", "Pedestrian Crossing", "Work Zone Ahead", "End Path Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "One Lane Road Ahead",
//                        description: "Warns of an upcoming single-lane section requiring alternating traffic flow, often controlled by a flagger or signal.",
//                        images: ["CW20-4"],
//                        wrongAnswers: ["Two Way Traffic", "Lane Ends", "Road Work Ahead", "Merge Left", "Detour Ahead", "Stop Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Lane Closed Ahead",
//                        description: "Warns that one or more lanes ahead will be closed due to construction or maintenance. Variants specify whether a right lane, multiple right lanes, or a bicycle lane is affected.",
//                        images: ["CW20-5R", "CW20-5aR", "CW20-5b"],
//                        wrongAnswers: ["Merge Left", "Lane Ends", "Work Zone Ahead", "Road Closed Ahead", "Keep Right", "End Road Work", "Detour Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Flagger Ahead",
//                        description: "Warns drivers that a flagger is directing traffic ahead. Drivers must slow down and prepare to stop when instructed.",
//                        images: ["CW20-7", "CW20-7a"],
//                        wrongAnswers: ["Stop Ahead", "Yield Ahead", "End Road Work", "Road Work Ahead", "Merge Ahead", "Detour Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Workers Ahead",
//                        description: "Indicates that workers are on or near the roadway. Drivers should reduce speed and proceed carefully.",
//                        images: ["CW21-1", "CW21-1a"],
//                        wrongAnswers: ["Flagger Ahead", "Road Work Ahead", "End Road Work", "Utility Work Ahead", "Detour Ahead", "Bump"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Fresh Oil",
//                        description: "Warns that freshly oiled road surfaces may cause slippery conditions and require reduced speed.",
//                        images: ["CW21-2"],
//                        wrongAnswers: ["Loose Gravel", "Slippery When Wet", "Bump", "Road Work Ahead", "Dusty Conditions", "End Road Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "Road Machinery Ahead",
//                        description: "Warns drivers that road machinery is operating ahead. Drivers should slow down and proceed with caution.",
//                        images: ["CW21-3"], // if there’s a distance variant image, include it
//                        wrongAnswers: ["Slow Moving Vehicle", "Shoulder Work", "Survey Crew", "Utility Work Ahead", "Right Shoulder Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Slow Moving Vehicle",
//                        description: "Warns drivers that a slow moving vehicle is on the road ahead. Drivers should reduce speed and be prepared to overtake safely.",
//                        images: ["CW21-4"],
//                        wrongAnswers: ["Road Machinery Ahead", "Shoulder Work", "Survey Crew", "Utility Work Ahead", "Shoulder Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Shoulder Work",
//                        description: "Warns drivers that work is taking place on the shoulder. Drivers should slow down and watch for workers and equipment. Distance variants indicate work ahead.",
//                        images: ["CW21-5"],
//                        wrongAnswers: ["Road Machinery Ahead", "Slow Moving Vehicle", "Survey Crew", "Utility Work Ahead", "Shoulder Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Shoulder Closed",
//                        description: "Warns drivers that the shoulder is closed. Distance variants indicate closure ahead, so drivers should adjust position and speed accordingly.",
//                        images: ["CW21-5aR", "CW21-5bR"],
//                        wrongAnswers: ["Road Machinery Ahead", "Slow Moving Vehicle", "Survey Crew", "Utility Work Ahead", "Shoulder Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Survey Crew Ahead",
//                        description: "Warns drivers that a survey crew is working on or near the roadway. Drivers should slow down and watch for personnel and equipment.",
//                        images: ["CW21-6"],
//                        wrongAnswers: ["Road Machinery Ahead", "Slow Moving Vehicle", "Shoulder Work", "Utility Work Ahead", "Shoulder Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Utility Work Ahead",
//                        description: "Warns drivers that utility work is taking place ahead. Drivers should be prepared for changes in road conditions or lane closures.",
//                        images: ["CW21-7"],
//                        wrongAnswers: ["Road Machinery Ahead", "Slow Moving Vehicle", "Shoulder Work", "Survey Crew", "Right Shoulder Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Mowing Ahead",
//                        description: "Warns drivers that mowing operations are taking place ahead. Distance variants indicate work further along the road. Drivers should slow down and watch for equipment and personnel.",
//                        images: ["CW21-8"],
//                        wrongAnswers: ["Road Machinery Ahead", "Slow Moving Vehicle", "Shoulder Work", "Survey Crew", "Utility Work Ahead", "Right Shoulder Closed"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Blasting Zone Ahead",
//                        description: "Warns of blasting operations taking place ahead. Drivers should turn off radios and proceed carefully.",
//                        images: ["CW22-1"],
//                        wrongAnswers: ["End Road Work", "Road Work Ahead", "Utility Work Ahead", "Flagger Ahead", "Detour Ahead", "Slow Traffic Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    TrafficSign(
//                        title: "End Blasting Zone",
//                        description: "Indicates the end of the blasting area. Normal travel may resume beyond this point.",
//                        images: ["CW22-3"],
//                        wrongAnswers: ["End Road Work", "End Detour", "End Utility Work", "Road Work Ahead", "End Work Zone", "End Slow Zone"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    // MARK: - Work Zone Signs
//                    TrafficSign(
//                        title: "Road Work Next (Distance) Miles",
//                        description: "Warns drivers that road work continues for the indicated distance ahead. Drivers should proceed with caution.",
//                        images: ["G20-1"],
//                        wrongAnswers: [
//                            "Road Work Ends",
//                            "Pilot Car Follow Me",
//                            "End Road Work",
//                            "Detour Ahead",
//                            "Flagger Ahead",
//                            "One Lane Road Ahead"
//                        ],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Road Work Ends",
//                        description: "Indicates that the road work zone has ended and normal driving conditions resume.",
//                        images: ["G20-2"],
//                        wrongAnswers: [
//                            "Road Work Next (Distance) Miles",
//                            "Pilot Car Follow Me",
//                            "End Detour",
//                            "Flagger Ahead",
//                            "Road Closed Ahead",
//                            "Detour Ends"
//                        ],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Pilot Car Follow Me",
//                        description: "Directs drivers to follow a pilot car through a work zone when normal lane guidance is disrupted.",
//                        images: ["G20-4"],
//                        wrongAnswers: [
//                            "Road Work Next (Distance) Miles",
//                            "Road Work Ends",
//                            "Flagger Ahead",
//                            "Detour Ahead",
//                            "End Road Work",
//                            "One Lane Road Ahead"
//                        ],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Work Zone Information Plaque",
//                        description: "Provides supplemental information about the work zone, such as type of work, restrictions, or special instructions for drivers.",
//                        images: ["G20-5aP"],
//                        wrongAnswers: [
//                            "Road Work Next (Distance) Miles",
//                            "Road Work Ends",
//                            "Pilot Car Follow Me",
//                            "Detour Ahead",
//                            "End Road Work",
//                            "Flagger Ahead"
//                        ],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Work Zone Signs"
//                    )
//                ]
//            ),
//            TrafficSubSection(
//                index: 2,
//                name: "Traffic Pattern Change",
//                description: "Warn of lane shifts, reverse curves, and temporary lane realignments in work zones. These signs help guide drivers through changed traffic patterns safely and predictably.",
//                signs: [
//                    TrafficSign(
//                        title: "New Traffic Pattern Ahead",
//                        description: "Informs drivers that lane configurations or routes have been recently changed due to construction or maintenance activities. Drivers should be alert for shifting lanes or new alignments.",
//                        images: ["W23-2"],
//                        wrongAnswers: ["Road Work Ahead", "Lane Ends", "Merge Ahead", "New Signal Ahead", "End Detour", "Flagger Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Traffic Pattern Change Signs"
//                    ),
//                    
//                    TrafficSign(
//                        title: "New Signal Operation Ahead",
//                        description: "Warns drivers of a newly installed or modified traffic signal ahead. Drivers should proceed with caution as others may not yet be familiar with the new signal pattern.",
//                        images: ["W23-2a"],
//                        wrongAnswers: ["Signal Ahead", "Stop Ahead", "Road Work Ahead", "End Road Work", "Detour Ahead", "New Traffic Pattern Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Traffic Pattern Change Signs"
//                    ),
//                    TrafficSign(
//                        title: "Double Reverse Curve",
//                        description: "Indicates a temporary lane shift or multiple reverse curves through a work zone. May apply to one, two, or three lanes, with both left and right variants. Drivers should reduce speed and follow the shifting lane alignment carefully.",
//                        images: ["CW24-1R", "CW24-1L", "CW24-1aR", "CW24-1aL", "CW24-1bR", "CW24-1bL"],
//                        wrongAnswers: ["Winding Road", "Lane Ends", "Road Work Ahead", "Merge Right", "Merge Left", "End Road Work"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Traffic Pattern Change Signs"
//                    ),
//                    TrafficSign(
//                        title: "All Lanes Shift",
//                        description: "Indicates that all lanes are shifted ahead due to construction or temporary traffic alignment.",
//                        images: ["CW24-1cP"],
//                        wrongAnswers: ["Merge Left", "Merge Right", "Lane Ends", "Two Way Traffic", "End Road Work", "Detour Ahead"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Traffic Pattern Change Signs"
//                    ),
//                    TrafficSign(
//                        title: "Exit Sign",
//                        description: "Indicates the status of upcoming exits. Can show an open exit, a closed exit, or an exit-only lane. Drivers should follow the signs accordingly.",
//                        images: ["E5-2", "E5-2a", "E5-3"],
//                        wrongAnswers: ["Road Work Ahead", "Merge Right", "Lane Ends", "Double Reverse Curve", "Reverse Curve"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Traffic Pattern Change Signs"
//                    ),
//                    TrafficSign(
//                        title: "Detour Sign",
//                        description: "Indicates detour routes for vehicles, bicycles, and pedestrians, including directional arrows and plaques with instructions for following the detour.",
//                        images: ["M4-8P", "M4-8a", "M4-9R", "M4-9L", "M4-9aR", "M4-9aL", "M4-9bR", "M4-9bL", "M4-9cR", "M4-9cL", "M4-10R", "M4-10L"],
//                        wrongAnswers: ["Bridge Out", "Stop", "Yield", "Slippery When Wet", "End Construction"],
//                        sectionName: "Temporary Traffic Control Signs",
//                        subSectionName: "Traffic Pattern Change Signs"
//                    ),
//                ]
//            )
//        ],
//        signs: []
//    )
//    
//    static let schoolSigns = TrafficSection(
//        index: 4,
//        name: "School Signs",
//        description: """
//Signs that indicate the presence of schools, school zones, school buses, and associated speed limits or crossing rules. Includes plaques with time, day, and flashing indicators to provide context-sensitive guidance.
//""",
//        subSections: nil,
//        signs: [
//            // General School
//            TrafficSign(
//                title: "School",
//                description: "Indicates a school zone or school nearby. Drivers should exercise caution.",
//                images: ["S1-1"],
//                wrongAnswers: ["Playground", "Hospital", "Pedestrian Crossing", "Stop", "Railroad Crossing"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            
//            // School Bus
//            TrafficSign(
//                title: "School Bus Stop Ahead",
//                description: "Warns drivers of an upcoming school bus stop. Be prepared to stop for buses picking up or dropping off students.",
//                images: ["S3-1"],
//                wrongAnswers: ["Bus Stop", "Train Crossing", "Pedestrian Crossing", "Yield", "Stop Sign Ahead"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "School Bus Turn Ahead",
//                description: "Indicates that a school bus may be turning ahead. Drivers should anticipate stopping or slowing.",
//                images: ["S3-2"],
//                wrongAnswers: ["Bus Stop Ahead", "Sharp Turn", "Curve Ahead", "Pedestrian Crossing", "Yield Ahead"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            // School Plaques
//            TrafficSign(
//                title: "School Plaque",
//                description: "Plaques that modify other school signs with time, day, or flashing indicators.",
//                images: ["S4-1P", "S4-2P", "S4-3P", "S4-4P", "S4-6P", "S4-7P"],
//                wrongAnswers: ["Speed Limit Plaque", "Route Plaque", "Exit Plaque", "Detour Plaque", "Warning Plaque"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            
//            // Reduced School Speed Limit
//            TrafficSign(
//                title: "Reduced School Speed Limit Ahead",
//                description: "Warns drivers that a reduced speed zone for school hours is approaching.",
//                images: ["S4-5", "S4-5a"],
//                wrongAnswers: ["Normal Speed Limit Ahead", "Curve Ahead", "Stop Ahead", "Lane Ends", "Yield Ahead"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            
//            // School Zone Speed Limit Signs
//            TrafficSign(
//                title: "School Zone Speed Limit",
//                description: "Indicates the school speed limit is in effect when flashing or during specified hours.",
//                images: ["S5-1", "S5-2", "S5-3"],
//                wrongAnswers: ["Normal Speed Limit", "Railroad Speed Limit", "Truck Speed Limit", "Roundabout", "Merge Ahead"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            
//            // In-Street & Overhead School Crossings
//            TrafficSign(
//                title: "Stop at Crosswalk",
//                description: "Indicates a designated school crossing where drivers must come to a complete stop when students are in the crosswalk.",
//                images: ["R1-5cL", "R1-5cR", "R1-6c", "R1-9c"],
//                wrongAnswers: ["Playground Zone", "School Ahead", "Children at Play", "Stop Ahead", "Crosswalk Closed", "Bus Stop Zone"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            ),
//            
//            TrafficSign(
//                title: "Yield at Crosswalk",
//                description: "Indicates a designated school crossing where drivers must slow down and yield to students in the crosswalk.",
//                images: ["R1-5aL", "R1-5aR", "R1-6b", "R1-9b"],
//                wrongAnswers: ["Playground Zone", "School Ahead", "Children at Play", "Yield Ahead", "Crosswalk Closed", "Bus Stop Zone"],
//                sectionName: "School Signs",
//                subSectionName: nil
//            )
//        ]
//    )
//    
//    static let all: [TrafficSection] = [
//        regulatorySigns,
//        warningSigns,
//        guideSigns,
//        temporaryTrafficControlSigns,
//        schoolSigns
//    ]}


//should be:

//Regulatory Signs
//Warning Signs and Object Markers
//Guide Signs
//Temporary Traffic Control Signs
//School Signs
