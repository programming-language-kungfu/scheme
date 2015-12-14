module Main where

import Eval
import Error
import SchemeParser
import System.Environment
import Control.Monad

main :: IO()
main = do
  args <- getArgs
  evaluatedValue <- return $ liftM show $ readExpr (args !! 0) >>= eval
  putStrLn $ extractValue $ trapError evaluatedValue
