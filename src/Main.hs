module Main where

import System.Environment
import Data.List

evaluateArgs :: [String] -> IO ()
evaluateArgs [] = putStrLn "Usage: -[a]ction{add, remove} -[c]ommand{command name} -argume[n]t {argument number x1, x2, x3, n (n = all > x3)} -{\"completion\"}"
--evaluateArgs (x:xs) = putStrLn $ "Adding " ++ completion ++ " to command " ++ command ++ " as argument numbers: " ++ numbers where
evaluateArgs xs = putStrLn $ "Completion: " ++ completion ++ " - command: " ++ command ++ " - numbers: " ++ numbers where
    completion = getFlag "-c" 1
    command = getFlag "-a" 1
    numbers = takeWhile (/= '-') $ getFlag "-n" (maxBound :: Int)
    getFlag flag n = concat . take n . drop 1 $ dropWhile (/= flag) xs



main :: IO ()
main = do
  args <- getArgs
  evaluateArgs args
  putStrLn "bye"
