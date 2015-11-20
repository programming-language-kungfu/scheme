module Paths_scheme (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/kaugust/code/haskell/scheme/.stack-work/install/x86_64-osx/lts-3.12/7.10.2/bin"
libdir     = "/Users/kaugust/code/haskell/scheme/.stack-work/install/x86_64-osx/lts-3.12/7.10.2/lib/x86_64-osx-ghc-7.10.2/scheme-0.1.0.0-JLFjl6gDdVKE9m5RcdvAH8"
datadir    = "/Users/kaugust/code/haskell/scheme/.stack-work/install/x86_64-osx/lts-3.12/7.10.2/share/x86_64-osx-ghc-7.10.2/scheme-0.1.0.0"
libexecdir = "/Users/kaugust/code/haskell/scheme/.stack-work/install/x86_64-osx/lts-3.12/7.10.2/libexec"
sysconfdir = "/Users/kaugust/code/haskell/scheme/.stack-work/install/x86_64-osx/lts-3.12/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "scheme_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "scheme_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "scheme_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "scheme_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "scheme_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
