-- Simulation of transmission of a String in a low-level
-- form as a list of binary digits.

import Data.Char
type Bit = Int


bin2int :: [Bit] -> Int
bin2int = foldl (\n x -> n * 2 + x) 0


int2bin :: Int -> [Bit]
int2bin n = reverse (int2bin' n)
            where
              int2bin' 0 = [0]
              int2bin' 1 = [1]
              int2bin' n = (n `mod` 2) : int2bin' (n `div` 2)


make8 :: [Bit] -> [Bit]
make8 bs = take n (repeat 0) ++ bs
           where
             n = 8 - length bs


encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)


chop8 :: [Bit] -> [[Bit]]
chop8 bs | null bs   = []
         | otherwise = take 8 bs : chop8 (drop 8 bs) 


decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8


channel :: [Bit] -> [Bit]
channel = id


transmit :: String -> String
transmit = decode . channel . encode




