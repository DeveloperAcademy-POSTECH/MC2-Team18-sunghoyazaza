//
//  DateVM.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/07.
//
//MARK: 날짜 VM

import Foundation
import SwiftUI

//MARK: 날짜 기본 틀
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day : Int
    var date : Date
    var key:String{
        let nowDate = self.date // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd" // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
}

//MARK: Date Struct
struct DateMetaData: Identifiable{
    var id = UUID().uuidString
    var date: Date
}

struct DateVM{
    //MARK: 날짜 가져오기 함수
    func getSimpleDate(offset: Int)->Date{
        let calendar = Calendar.current
        
        let date = calendar.date(byAdding: .day, value: offset, to: Date())
        
        return date ?? Date()
    }
    
    var dateModel = DateModel.shared
    
//    //MARK: 데이터를 활용해 목표 달성한 날짜 뿌려주기
//    func datesHavingDots()->[DateMetaData]{
//        var datesHavingDots : [DateMetaData] = dateModel.datesForTasks.map { offset in
//            DateMetaData(date: getSimpleDate(offset: offset))
//        }
//
//        return datesHavingDots
//    }
//
//
//    //MARK: 메인 문구를 위해 연속적인 날이 있는지 확인하는 함수
//    func findConsecutiveDays()->Int{
//        var dates = dateModel.datesForTasks
//
//        //날짜 내림차순
//        dates.sort(by: >)
//        var index = 0
//        var consecutiveDays : Int
//
//        //내림차순 후 제일 첫 숫자가 -1일시 (전날 성공했으니 index+1 해서 다음 날 탐색. BruteForce?)
//        if dateModel.datesForTasks[0] == -1{
//            while dateModel.datesForTasks[index] == dateModel.datesForTasks[index+1] + 1{
//                index += 1
//            }
//            consecutiveDays = index + 1
//            // -1이 없다면 전날 실패했으니 연속 날짜가 없으므로 0 반환
//        }else{
//            consecutiveDays = 0
//        }
//
//        return consecutiveDays
//    }
}
