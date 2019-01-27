{-# LANGUAGE ScopedTypeVariables #-}

module Lib
  ( sumFunc
  ) where

import           Data.List.Split
import           System.IO
import           Text.Read

sumFunc :: String -> Int -> IO ()
sumFunc fs acc = do
  x <- getLine
  eof <- isEOF
  if eof
    then print $ innerSum x
    else sumFunc fs $ innerSum x
  where
    innerSum :: String -> Int
    innerSum x = acc + foldl f 0 (toNums x)
    readMaybeInt :: String -> Maybe Int
    readMaybeInt = readMaybe
    toNums :: String -> [Int]
    toNums x = map (maybe 0 (* 1) . readMaybeInt) (splitOn " " x)
    f :: (Int -> Int -> Int)
    f = conv fs
    conv :: String -> (Int -> Int -> Int)
    conv "+" = (+)
    conv "*" = (*)
