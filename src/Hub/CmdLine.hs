-- Copyright (C) 2016 Ulf Leopold
--
{-# LANGUAGE DeriveDataTypeable #-}
module Hub.CmdLine (getAppConfig, AppConfig(AppConfig, profile, tags)) where

import System.Console.CmdArgs

data AppConfig = AppConfig
    { profile :: Bool
    , tags :: [String]
    } deriving (Show, Data, Typeable)

config =
    AppConfig
    { profile = def &= name "p" &= help "Enable profiling"
    , tags = def &= args
    } &=
    summary "Hub, Copyright (C) 2016 Ulf Leopold"

getAppConfig :: IO AppConfig
getAppConfig = cmdArgs config
