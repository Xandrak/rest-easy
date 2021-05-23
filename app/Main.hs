module Main where
import qualified Web.Scotty as Scotty

import qualified Routes

main :: IO ()
main = do
  putStrLn "Bootin' up, Cap'n!"
  Scotty.scotty 3000 Routes.routes
