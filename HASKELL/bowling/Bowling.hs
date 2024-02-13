module Bowling where

data Frame = Open Int Int
            | Spare Int Int
            | Strike Int Int
            deriving (Eq, Show)


-- instance Eq Frame where
--     Open x y == Open x' y' = x == x' && y == y'
--     Spare x y == Open x' y' = x == x' && y == y'
--     Strike x y == Open x' y' = x == x' && y == y'
--     _ == _ = False

-- instance Show Frame where
--     show (Open x y) = "Open " ++ show x ++ " " ++ show y
--     show (Spare x y) = "Spare " ++ show x ++ " " ++ show y
--     show (Strike x y) = "Strike " ++ show x ++ " " ++ show y

toFrames :: [Int] -> [Frame]
toFrames (x:y:ys) = Open x y : toFrames ys
toFrames [] = []

