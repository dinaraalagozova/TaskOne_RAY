//
//  ViewController.swift
//  TaskOne_RAY
//
//  Created by Dinara Alagozova on 15.05.2023.
//

import UIKit

class ViewController: UIViewController {
   
    var matrix: [[Int]] = [
           [1, 0, 1],
           [0, 1, 0],
           [0, 0, 0]
       ]
       
    var distances: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distances = calculateDistances(matrix: matrix)
               
        // Выводим полученные расстояния
        for row in distances {
                print(row)
            }
    }
        
        func calculateDistances(matrix: [[Int]]) -> [[Int]] {
            let rows = matrix.count
            let columns = matrix[0].count
            
            // Создаем новую матрицу для хранения расстояний
            var distances = Array(repeating: Array(repeating: Int.max, count: columns), count: rows)
            
            // Переменная для хранения текущего расстояния
                var currentDistance = 0
                
                // Проходимся по матрице и обновляем расстояние для каждой ячейки
                for i in 0..<rows {
                    for j in 0..<columns {
                        if matrix[i][j] == 1 {
                            // Если текущая ячейка содержит 1, то расстояние равно 0
                            distances[i][j] = 0
                            currentDistance = 0
                        } else {
                            // Иначе находим расстояние до ближайшей ячейки со значением 1
                            currentDistance += 1
                            distances[i][j] = currentDistance
                        }
                    }
                    currentDistance = 0
                }
                
                // Проходимся по матрице в обратном направлении и обновляем расстояния
                for i in (0..<rows).reversed() {
                    for j in (0..<columns).reversed() {
                        if matrix[i][j] == 1 {
                            // Если текущая ячейка содержит 1, то расстояние равно 0
                            distances[i][j] = 0
                            currentDistance = 0
                        } else {
                            // Иначе проверяем расстояние к соседней ячейке с минимальным расстоянием
                            currentDistance += 1
                            distances[i][j] = min(distances[i][j], currentDistance)
                        }
                    }
                    currentDistance = 0
                }
            return distances
        }

    }
    
    
   
