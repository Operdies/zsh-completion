module Main where

import System.Environment

evaluateArgs :: [String] -> IO ()
evaluateArgs [] = putStrLn "Usage: -{command name} -n {n1, n2, n3} -{completion}"

main :: IO ()
main = do
  args <- getArgs
  evaluateArgs args
  putStrLn "bye"
