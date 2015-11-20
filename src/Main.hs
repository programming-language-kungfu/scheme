module Main where
import System.Environment
import Parser

main :: IO()
main = do
  (expr: _) <- getArgs
  putStrLn (readExpr expr)
