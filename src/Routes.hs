module Routes where

import qualified Web.Scotty as Scotty

import qualified Actions.GetCourses as GetCourses

routes :: Scotty.ScottyM ()
routes = do
  Scotty.get "/ahoy" GetCourses.run