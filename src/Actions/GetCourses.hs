module Actions.GetCourses where

import qualified Web.Scotty as Scotty

run :: Scotty.ActionM ()
run = do
  Scotty.text "Ahoy, matey!"