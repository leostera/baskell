module Main where

import System.Environment (getArgs)

import Parser (parse)
import Interpreter (run)

data BaskellErrors = TooFewArgs | TooManyArgs

instance Show BaskellErrors where
  show TooManyArgs = "TooManyArgs"
  show TooFewArgs = "TooFewArgs"

main :: IO ()
main = do
  args <- getArgs
  let filename = parseArgs args
  content <- readFile filename
  either print run (parse content)

parseArgs :: [String] -> String
parseArgs [file] = file
