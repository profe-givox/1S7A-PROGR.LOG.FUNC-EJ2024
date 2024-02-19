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



toFrames :: [Int] -> Maybe [Frame]
toFrames pins = go 1 pins
    where
        go 10 [x, y]
            | x + y < 10 = Just [Open x y]
            | otherwise = Nothing
        go 10 [x, y, z]
            | x == 10 = Just [Strike y z]
            | x + y == 10 = Just [Spare x z]
            | otherwise = Nothing
        go n (x:y:z:ys)
            | x == 10 = fmap (Strike y z :) $ go (n+1) (y:z:ys)
            | x + y == 10 = fmap (Spare x z :) $ go (n+1) (z:ys)
            | x + y < 10 = fmap (Open x y :) $ go (n+1) (z:ys)
            | otherwise = Nothing
        go _ _ = Nothing

frameScore :: Frame -> Int
frameScore (Open x y) = x + y
frameScore (Spare _ y) = 10 + y
frameScore (Strike x y) = 10 + x + y

score :: [Frame] -> Int
score frames = sum $ map frameScore frames
