module Bookworm.ExpandPage
    (
        ExpandPageWithFill(..),
        mkExpandPageWithFill,
    ) where

import Bookworm.Types
import qualified Bookworm.Util as Util


data ExpandPageWithFill = ExpandPageWithFill { 
    source :: Source,
    target :: Target,
    width  :: Width,
    height :: Height
}

mkExpandPageWithFill :: Source -> Target -> Width -> Height -> ExpandPageWithFill
mkExpandPageWithFill = ExpandPageWithFill

unpack :: ExpandPageWithFill -> (Source, Target, Width, Height)
unpack action =(source action, target action, width action, height action)

instance SubCommand ExpandPageWithFill where
    toTerminalCommand comm = 
            command ++ " " ++ extent       ++ " " ++ background ++ " " ++ 
            gravity ++ " " ++ quotedSource ++ " " ++ finalArg
        where
            w = show $ width comm
            h = show $ height comm
            quotedSource = Util.quoteString (source comm)
            quotedTarget = Util.quoteString (target comm)
            command = "convert"
            extent  = "-extent " ++ w ++ "x" ++ h
            background = "-background white"
            gravity = "-gravity Center"
            finalArg = quotedTarget ++ "[" ++ w ++ "x" ++ h ++ "]"
