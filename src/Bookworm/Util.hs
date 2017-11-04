module Bookworm.Util
    (
        quoteString,
    ) where


quoteHead :: Char -> String
quoteHead '\"' = "\""
quoteHead ch = '\"':[ch]
        
quoteTail :: Char -> String
quoteTail '\"' = "\""
quoteTail ch = ch:['\"']

quoteString :: String -> String
quoteString "" = "\"\""
quoteString (ch:[]) = quoteHead ch ++ "\""
quoteString st = quoteHead (head st) ++ body st ++ quoteTail (last st)
    where
        body st = reverse . tail . reverse . tail $ st
