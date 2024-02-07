module FizzBuzz where

ifThenElse :: Bool -> a -> a -> a
ifThenElse cond thenVal elseVal =
    case cond of
        True -> thenVal
        False -> elseVal    

fizzbuzz :: Int -> String
fizzbuzz 1 = "One"
fizzbuzz 2 = "Two"
fizzbuzz _ = "other"
-- fizzbuzz n 
--            | n == 3 = "Three!" 
--            | n == 4 = "Four!"
--            | otherwise = "Other!"

lessThan20 :: Int -> String           
lessThan20 n
        |n >0 && n<20 = 
        let answers = words ("one two three four five six seven eight nine ten " ++
                        "eleven twelve thirteen fourteen fifteen sixteen " ++
                        "seventeen eighteen nineteen")
        in answers!!(n-1) 

tens :: Int -> String
tens n 
    | n > 1 && n <= 9 =
        answers!!(n-2)
        where
            answers = words "twenty thirty forty fifty sixty seventy eighty ninety"

--
number :: Int -> String
number n 
    | n>0 && n<20 = lessThan20 n
    | n `mod` 10 == 0 && n < 100  = tens (n `div` 10)
    | n < 100 = tens (n `div` 10) ++ " " 