module Actions.GetCourses where

import qualified Web.Scotty as Scotty

one :: Scotty.ActionM ()
one = do
  Scotty.text "Ahoy, matey!"

all :: Scotty.ActionM ()
all = do
  Scotty.text "Ahoy, matey!"