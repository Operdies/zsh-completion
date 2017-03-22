module Main where

import           Control.Monad
import           Data.List
import           System.Environment
import           System.IO
import           System.Process


printUsage :: IO()
printUsage = let printDesc (x,y) = putStrLn $ "   " ++ x ++ "\t" ++ y ++ "\n"
             in do
                putStrLn "Usage:\n"
                printDesc ("-[a]ction","add, remove")
                printDesc ("-[c]ommand","command name")
                printDesc ("-argume[n]t","argument number - the indices you want the completion to be applicable at. Default=All")
                printDesc ("-com[p]letion","whatever completion you want to add or remove")



evaluateArgs :: [String] -> IO ()
evaluateArgs [] = printUsage
evaluateArgs xs = putStrLn $ "Action: " ++ action ++
                             " Command: " ++ command ++
                             " numbers: " ++ show numbers ++
                             " completion: " ++ completion
                             where
                                completion = concat $ getFlag "-p" 1
                                action = concat $ getFlag "-a" 1
                                command = concat $ getFlag "-c" 1
                                numbers = takeWhile (\x -> head x /= '-') $ getFlag "-n" (maxBound :: Int)
                                getFlag flag n = take n . drop 1 $ dropWhile (/= flag) xs

readDirectory :: IO String
readDirectory = readProcess "ls" [] []


main :: IO ()
main = do
    prog <- getProgName
    args <- getArgs
    evaluateArgs args
    putStrLn $ prog ++ " is outta here"
