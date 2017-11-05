module Bookworm.Types
    (
        Units(..),
        Resolution(..),
        mkResolution,
        Action(..),
        SubCommand(..),
        Source(..),
        Target(..),
        Width(..),
        Height(..),
    ) where

import System.Process


data Units = PixelsPerInch
           | PixelsPerCentimeter
           deriving (Show)


data Resolution a = Resolution a Units

instance Show a => Show (Resolution a) where
    show (Resolution a units) = show a ++ " " ++ show units


mkResolution :: Integral a => a -> Units -> Resolution a
mkResolution a units = Resolution a units


type Source = String
type Target = String
type Width  = Integer
type Height = Integer


type Action = CreateProcess

type Arguments = [String]

class SubCommand comm where
    toTerminalCommand :: comm -> String

    fromTerminalArguments :: Arguments -> Maybe comm
    
    toProcess :: comm -> Action
    toProcess comm = shell $ toTerminalCommand comm
