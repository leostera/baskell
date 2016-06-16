module Interpreter (run) where

import Parser

run :: [Instruction] -> IO ()
run = mapM_ interpret

interpret :: Instruction -> IO ()
interpret (Line _ (Print str)) = putStrLn str
