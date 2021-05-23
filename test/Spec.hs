module Spec where

import qualified Control.Monad.IO.Class as IO
import qualified Test.Hspec as Test
import qualified Web.Scotty as Scotty

main :: IO ()
main = 
  Test.hspec $ do
    Test.describe "Thing" $ do
      Test.it "returns thing" $ 
        Test.pending
