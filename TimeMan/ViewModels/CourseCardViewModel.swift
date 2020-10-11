//
//  CourseCardViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/11/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

class CourseCardViewModel {
    @Environment(\.managedObjectContext) var managedObjectContext

    func deleteItem(course: Course) {
        managedObjectContext.delete(course)
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
    }

    func getClassType(course: Course) -> String {
        if course.isLecture {
            return course.lectureNumber!
        } else if course.isTutorial {
            return course.tutorialNumber!
        } else if course.isPractical {
            return course.practicalNumber!
        }
        return ""
    }
}
