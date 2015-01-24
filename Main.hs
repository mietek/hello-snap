import Snap.Core
import Snap.Http.Server
import System.Environment

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe 8080 read $ lookup "PORT" env
        config = setPort port
               . setAccessLog ConfigNoLog
               . setErrorLog ConfigNoLog
               $ defaultConfig
    httpServe config $
      ifTop $ writeBS "Hello, world!"
