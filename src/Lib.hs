{-# LANGUAGE ScopedTypeVariables #-}

module Lib
  ( sumFunc
  ) where

import           Data.List.Split
import           System.IO
import           Text.Read

sumFunc :: Int -> IO ()
sumFunc acc = do
  x <- getLine
  eof <- isEOF
  if eof
    then print acc
    else sumFunc $ acc + sum (toNums x)
  where
    readMaybeInt :: String -> Maybe Int
    readMaybeInt = readMaybe
    toNums :: String -> [Int]
    toNums x = map (maybe 0 (* 1) . readMaybeInt) (splitOn " " x)
