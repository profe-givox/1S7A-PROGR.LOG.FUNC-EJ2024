module FizzBuzz where

ifThenElse :: Bool -> a -> a -> a
ifThenElse cond thenVal elseVal =
    case cond of
        True -> thenVal
        False -> elseVal    

fizzbuzz :: Int -> String
fizzbuzz n 
           | n == 1 = "One!" 
           | n == 2 = "Two!"
           | (n /= 1 ) || ( n/= 2 ) = "Three!"