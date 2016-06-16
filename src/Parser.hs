module Parser (parse) where

import qualified Text.Parsec as P
import Text.Parsec.String (Parser)
import Text.Parsec.Char (anyChar, digit, spaces, string, alphaNum)
import Text.Parsec.Combinator (many1)

data Instruction = Line Int Expression deriving Show
data Expression  = Print String deriving Show

parse :: String -> Either P.ParseError Instruction
parse = P.parse instruction ""

instruction :: Parser Instruction
instruction = do
  lineNo <- many1 digit
  spaces
  expr   <- expression
  return $ Line (read lineNo) expr

expression :: Parser Expression
expression = do
  string "PRINT"
  spaces
  args <- many1 anyChar
  return $ Print (read args)
