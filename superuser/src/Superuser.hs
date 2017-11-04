module Superuser
    (
        userIsAdministrator,
    ) where


import System.Posix.User (getEffectiveUserID)


-- | Determines if the current running process is running as root.
userIsAdministrator :: IO Bool
userIsAdministrator = (\euid -> euid == 0) <$> getEffectiveUserID 
