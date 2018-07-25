{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE OverloadedStrings #-}

module API
  ( API
  , server
  ) where

import Data.Text (Text)
import Dependencies
import Dependency
import Distribution.Types.GenericPackageDescription (GenericPackageDescription)
import Distribution.Types.GenericPackageDescription.MimeUnrender ()
import Servant

type API = "parse" :> ReqBody '[PlainText] GenericPackageDescription :> Post '[JSON] [Dependency]
         :<|> Get '[PlainText] Text

server :: Server API
server = (return . dependencies) :<|> return ""
