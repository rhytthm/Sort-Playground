import UIKit


extension Array where Element: Comparable {
    //MARK - BUBBLE SORT O(n²)
    func bubbleSort(by increasingOrder: ((Element,Element) -> Bool) = (<)) -> [Element] {
        var data = self
        for i in 0..<(data.count-1) {
            for j in 0..<(data.count-i-1) where increasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        return data
    }
    //MARK - INSERTION SORT O(n²)
    func insertionSort(by increasingOrder: ((Element,Element) -> Bool) = (<)) -> [Element]{
        var data = self
        for i in 1..<(data.count-1) {
            let key = data[i]
            var j = i - 1
            while j >= 0 && increasingOrder(key, data[j]) {
                data[j+1] = data[j]
                j = j - 1
            }
            data[j + 1] = key
        }
        return data
    }
    //MARK - SELECTION SORT O(n²)
    func selectionSort(by increasingOrder: ((Element,Element) -> Bool) = (<)) -> [Element]{
        var data = self
        for i in 0..<(data.count-1) {
            var key = i
            for j in i+1..<(data.count) where increasingOrder(data[j],data[key]){
                key = j
            }
            guard i != key else { continue }
            data.swapAt(i, key)
        }
        return data
    }
    
    //MARK - MERGE SORT
    func mergeSort() -> [Element]{
        var data = self
        guard data.count>1 else{
            return data
        }
        var lhs = Array(data[0..<data.count/2])
        var rhs = Array(data[data.count/2..<data.count])
        
        return mergeElements(lhs: lhs.mergeSort(), rhs: rhs.mergeSort())
    }
    
    func mergeElements(lhs:[Element], rhs:[Element]) -> [Element]{
        var lhs = lhs
        var rhs = rhs
        var mergedArray: [Element] = []
        while lhs.count>0 && rhs.count>0 {
            if lhs.first! < rhs.first!{
                mergedArray.append(lhs.removeFirst())
            }else{
                mergedArray.append(rhs.removeFirst())
            }
        }
        return mergedArray + lhs + rhs
    }
    
    //MARK - QUICK SORT O(nlogn)
    
}

func swap<T: Comparable>(left: inout T, right: inout T){
    let temp = right
    right = left
    left = temp
}


let myArray = [4, 2, 0, 1]

//let ascendingSorted = myArray.bubbleSort(by: <)
//let descendingSorted = myArray.bubbleSort(by: >)

//let ascendingSorted = myArray.insertionSort(by: <)
//let descendingSorted = myArray.insertionSort(by: >)


//let ascendingSorted = myArray.selectionSort(by: <)
//let descendingSorted = myArray.selectionSort(by: >)

let ascendingSorted = myArray.mergeSort()









//
//var newArray: [Int] = []
//func reverseArray(arr: [Int]){
//    var data = arr
//    guard data.count>1 else{
//        return data
//    }
//
//    reverseArray(arr: recurse(arr: &arr))
//
//}
//
//func recurse( arr:inout [Int])->[Int]{
//    newArray.append(arr.removeLast())
//    return arr
//}










