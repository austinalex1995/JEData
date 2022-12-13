//
//  JEData.swift
//  JarvisEd_iOS
//  TOP Development
//

import Foundation

class JEData {
    
    /*
     *
     * Member Variables
     *
     */
    
    public static let global:JEData = JEData.init()
    private var mCurrentUser:JEUser?
    private var mStudentList:[JEStudent]
    private var mTeacherList:[JETeacher]
    private var mAdminList:[JEAdmin]
    private var mReportList:[JEReport]
    private var mClassList:[JEClass]
    private var mPointSystemSettings:JEPointSystem?
    private var mSchoolYearSettings:SchoolYearDetails?
    private var mMessageSets:[JEMessageSet]
    
    
    
    /*
     *
     * Constructor
     *
     */
    
    private init() {
        
        mStudentList = []
        mTeacherList = []
        mAdminList = []
        mReportList = []
        mMessageSets = []
        mClassList = []
        mCurrentUser = nil
        mPointSystemSettings = nil
        mSchoolYearSettings = nil
        
    }
    
    
    
    /*
     *
     * Class Methods
     *
     */
    
    public static func getNumberOfDaysBetweenDates(from:Date, to:Date) -> Int {
        
        var fromDate = Calendar.current.startOfDay(for: from)
        let toDate = Calendar.current.startOfDay(for: to)
        var numOfWeekdays = 0
        while fromDate < toDate {
            if (!Calendar.current.isDateInWeekend(fromDate)) {
                //print("weekday")
                numOfWeekdays += 1
            }
            guard let nextDay = JEData.global.nextDay(date: fromDate) else {
                //print("Failed to get next day")
                fatalError("Could not instantiate next day")
            }
            fromDate = nextDay
        }
        //let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate, to: toDate)
        return numOfWeekdays
        
    }
    
    private func nextDay(date:Date) -> Date? {
        
        let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
        //print(newDate?.description)
        return newDate
        
    }
    
    public static func getSubstring(thisString:String, index:Int) -> String {
        
        let start = thisString.index(thisString.startIndex, offsetBy: index)
        let end = thisString.index(thisString.startIndex, offsetBy: index+1)
        let range = start..<end
        return thisString[range].description
        
    }
    
    public static func getTimestamp() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        var monthAsString: String = ""
        if (month == 1) {
            monthAsString = "January"
        } else if (month == 2) {
            monthAsString = "February"
        } else if (month == 3) {
            monthAsString = "March"
        } else if (month == 4) {
            monthAsString = "April"
        } else if (month == 5) {
            monthAsString = "May"
        } else if (month == 6) {
            monthAsString = "June"
        } else if (month == 7) {
            monthAsString = "July"
        } else if (month == 8) {
            monthAsString = "August"
        } else if (month == 9) {
            monthAsString = "September"
        } else if (month == 10) {
            monthAsString = "October"
        } else if (month == 11) {
            monthAsString = "November"
        } else if (month == 12) {
            monthAsString = "December"
        }
        
        var dayOrNight: String = ""
        var hourAsString: String = ""
        if (hour == 0) {
            hourAsString = "12"
            dayOrNight = "AM"
        } else if (hour == 12) {
            hourAsString = "12"
            dayOrNight = "PM"
        } else if (hour > 12) {
            hourAsString = (hour - 12).description
            dayOrNight = "PM"
        } else {
            hourAsString = hour.description
            dayOrNight = "AM"
        }
        
        var minutesAsString = minutes.description
        if (minutesAsString.count == 1) {
            minutesAsString = "0" + minutesAsString
        }
        
        return (monthAsString + " " + day.description + ", " + year.description + " " + hourAsString + ":" + minutesAsString + " " + dayOrNight)
        
    }
    
    public func addStudentToList(student:JEStudent) {
        
        mStudentList.append(student)
        
    }
    
    public func removeStudentFromList(student:JEStudent) {
        
        var index = -1
        for i in 0...mStudentList.count-1 {
            
            if (mStudentList[i].getID() == student.getID()) {
                index = i
                break
            }
            
        }
        
        if (index != -1) {
            mStudentList.remove(at: index)
        }
        
    }
    
    public func getStudentList() -> [JEStudent] {
        
        return mStudentList
        
    }
    
    public func addTeacherToList(teacher:JETeacher) {
        
        mTeacherList.append(teacher)
        
    }
    
    public func removeTeacherFromList(teacher:JETeacher) {
        
        var index = -1
        for i in 0...mTeacherList.count-1 {
            
            if (mTeacherList[i].getID() == teacher.getID()) {
                index = i
                break
            }
            
        }
        
        if (index != -1) {
            mTeacherList.remove(at: index)
        }
        
    }
    
    public func getTeacherList() -> [JETeacher] {
        
        return mTeacherList
        
    }
    
    public func addAdminToList(admin:JEAdmin) {
        
        mAdminList.append(admin)
        
    }
    
    public func removeAdminFromList(admin:JEAdmin) {
        
        var index = -1
        for i in 0...mAdminList.count-1 {
            
            if (mAdminList[i].getID() == admin.getID()) {
                index = i
                break
            }
            
        }
        
        if (index != -1) {
            mAdminList.remove(at: index)
        }
        
    }
    
    public func getAdminList() -> [JEAdmin] {
        
        return mAdminList
        
    }
    
    public func addReportToList(report:JEReport) {
        
        mReportList.append(report)
        
    }
    
    public func removeReportFromList(report:JEReport) {
        
        var index = -1
        for i in 0...mReportList.count-1 {
            
            if (mReportList[i].getId() == report.getId()) {
                index = i
                break
            }
            
        }
        
        if (index != -1) {
            mReportList.remove(at: index)
        }
        
    }
    
    public func getReportList() -> [JEReport] {
        
        return mReportList
        
    }
    
    public func clearReportList() {
        
        mReportList.removeAll()
        
    }
    
    public func setCurrentUser(user:JEUser) {
        
        mCurrentUser = user
        
    }
    
    public func getCurrentUser() -> JEUser? {
        
        return mCurrentUser
        
    }
    
    public func setPointSystemSettings(pointSystemSettings:JEPointSystem) {
        
        mPointSystemSettings = pointSystemSettings
        
    }
    
    public func getPointSystemSettings() -> JEPointSystem? {
        
        return mPointSystemSettings
        
    }
    
    public func setSchoolYearDetails(schoolYearDetails:SchoolYearDetails) {
        
        mSchoolYearSettings = schoolYearDetails
        
    }
    
    public func getSchoolYearDetails() -> SchoolYearDetails? {
        
        return mSchoolYearSettings
        
    }
    
    public func addMessageSet(messageSet:JEMessageSet) {
        
        mMessageSets.append(messageSet)
        
    }
    
    public func getMessageSets() -> [JEMessageSet] {
        
        return mMessageSets
        
    }
    
    public func addClassToList(classroom:JEClass) {
        
        mClassList.append(classroom)
        
    }
    
    public func getClassList() -> [JEClass] {
        
        return mClassList
        
    }
    
    public func clearClassList() {
        
        mClassList.removeAll()
        
    }
    
}
