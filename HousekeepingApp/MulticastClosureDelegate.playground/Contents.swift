/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation

// MARK: - MulticastClosureDelegate
public class MulticastClosureDelegate<Success, Failure> {
  
  // MARK: - Callback
  class Callback {
    let queue: DispatchQueue
    let success: Success
    let failure: Failure
    
    init(queue: DispatchQueue, success: Success, failure: Failure) {
      self.queue = queue
      self.success = success
      self.failure = failure
    }
  }
  
  // MARK: - Instance Properties
  fileprivate var mapTable = NSMapTable<AnyObject, NSMutableArray>.weakToStrongObjects()
  
  public var count: Int {
    return getCallbacks(removeAfter: false).count
  }
  
  // MARK: - Instance Methods
  public func addClosurePair(for objectKey: AnyObject, queue: DispatchQueue = .main, success: Success, failure: Failure) {
    let callback = Callback(queue: queue, success: success, failure: failure)
    let array = mapTable.object(forKey: objectKey) ?? NSMutableArray()
    array.add(callback)
    mapTable.setObject(array, forKey: objectKey)
  }
  
  public func getSuccessTuples(removeAfter: Bool = true) -> [(Success, DispatchQueue)] {
    return getCallbacks(removeAfter: removeAfter).map({ (callback) in
      return (callback.success, callback.queue)
    })
  }
  
  public func getFailureTuples(removeAfter: Bool = true) -> [(Failure, DispatchQueue)] {
    return getCallbacks(removeAfter: removeAfter).map({ (callback) in
      return (callback.failure, callback.queue)
    })
  }
  
  fileprivate func getCallbacks(removeAfter: Bool = true) -> [Callback] {
    let objects = mapTable.keyEnumerator().allObjects as [AnyObject]
    let callbacks: [Callback] = objects.reduce([]) { (combinedArray, objectKey) in
      let array = mapTable.object(forKey: objectKey)! as! [Callback]
      return combinedArray + array
    }
    
    guard removeAfter else { return callbacks }
    objects.forEach { (object) in
      mapTable.removeObject(forKey: object)
    }
    
    return callbacks
  }
}

// MARK: - Testing
typealias Success = () -> Void
typealias Failure = () -> Void

let multicastDelegate = MulticastClosureDelegate<Success, Failure>()
let delegate = NSObject()

multicastDelegate.addClosurePair(for: delegate, success: { print("GOOD") }, failure: { print("BAD") })

print("Way1: ")
var callback = multicastDelegate.mapTable.object(forKey: delegate)?.firstObject as! MulticastClosureDelegate<Success, Failure>.Callback
callback.success()

print("Way2: ")
callback = multicastDelegate.getCallbacks(removeAfter: false).first!

let (success, queue) = multicastDelegate.getSuccessTuples(removeAfter: false).first!
success()

print("MulticastDelegate count: \(multicastDelegate.count)")


// MARK: - Multithreading
//print("-- Multithreading --")
//multicastDelegate.mapTable.removeAllObjects()
//
//let count = 3
//for _ in 0 ..< 3 {
//  DispatchQueue.global(qos: .background).async {
//    multicastDelegate.addClosurePair(for: objectKey, success: {
//
//    }, failure: {
//    })
//    print("count: \(multicastDelegate.count)")
//  }
//}


