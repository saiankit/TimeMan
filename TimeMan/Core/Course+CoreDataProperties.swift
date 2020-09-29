//
//  Course+CoreDataProperties.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/27/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//
//

import Foundation
import CoreData

extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }
    
    


    @NSManaged public var courseTitle: String?
    @NSManaged public var courseCode: String?
    @NSManaged public var courseID: String?
    @NSManaged public var instructorName: String?
    @NSManaged public var time: Date?
    @NSManaged public var meetLink: String?
    @NSManaged public var lectureNumber: String?
    @NSManaged public var tutorialNumber: String?
    @NSManaged public var practicalNumber: String?
    @NSManaged public var isLecture: Bool
    @NSManaged public var isTutorial: Bool
    @NSManaged public var isPractical: Bool
    @NSManaged public var tutorialExists: Bool
    @NSManaged public var practicalExists: Bool
    @NSManaged public var lectureExists: Bool
    @NSManaged public var weekDayRepeat: Set<String>?
    @NSManaged public var id: UUID?

}

extension Course : Identifiable {

}