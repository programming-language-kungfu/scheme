module Types where

data LispVal = Atom String
             | List [LispVal]
             | DottedList [LispVal] LispVal
             | Number Integer
             | String String
             | Bool Bool

unWordList :: [LispVal] -> String
unWordList = unwords . map showVal

showVal :: LispVal -> String
showVal (String contents) = "\"" ++ contents ++ "\""
showVal (Atom name) = name
showVal (Number contents) = show contents
showVal (Bool True) = "#t"
showVal (Bool False) = "#f"
showVal (List contents) = "(" ++ unWordList contents ++ ")"
showVal (DottedList head tail) = "(" ++ unWordList head ++ "." ++ showVal tail ++ ")"

instance Show LispVal where show = showVal
