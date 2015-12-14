module Error (LispError(..), ThrowsError, extractValue, trapError) where

import Text.ParserCombinators.Parsec.Error
import Control.Monad.Error.Class
import Types

data LispError = NumArgs Integer [LispVal]
               | TypeMismatch String LispVal
               | Parser ParseError
               | BadSpecialForm String LispVal
               | NotFunction String String
               | UnboundVar String String
               | Default String

showError :: LispError -> String
showError (UnboundVar message varname) = message ++ ": " ++ varname
showError (BadSpecialForm message form) = message ++ ": " ++ show form
showError (NotFunction message func) = message ++ ": " ++ show func
showError (NumArgs expected found) = "Expected: " ++ show expected ++ " args; found " ++ unWordList found
showError (TypeMismatch expected found) = "Invalid type: expected " ++ expected ++ ", found" ++ show found
showError (Parser error) = "Parser Error at " ++ show error

instance Show LispError where show = showError
instance Error LispError where
      noMsg = Default "An error has occurred"
      strMsg = Default

type ThrowsError = Either LispError

trapError action = catchError action (return . show)

extractValue :: ThrowsError a -> a
extractValue (Right val) = val
