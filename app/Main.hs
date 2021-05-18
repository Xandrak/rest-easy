module Main where

import Lib

import qualified Web.Scotty as Scotty

main :: IO ()
main = do
    putStrLn "Bootin' up, Cap'n!"
    Scotty.scotty 3000 routes

routes :: Scotty.ScottyM ()
routes = do
    Scotty.get "/ahoy" getAction

getAction :: Scotty.ActionM ()
getAction = do
    Scotty.text "Ahoy, matey!"