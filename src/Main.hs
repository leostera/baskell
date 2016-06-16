module Main where

import System.Environment (getArgs)

import Parser (parse)

data BaskellErrors = TooFewArgs | TooManyArgs

instance Show BaskellErrors where
  show TooManyArgs = "TooManyArgs"
  show TooFewArgs = "TooFewArgs"

main :: IO ()
main = do
  args <- getArgs
  let filename = parseArgs args
  content <- readFile filename
  print content
  let parsedBasic = parse content
  print parsedBasic

parseArgs :: [String] -> String
parseArgs [file] = file
