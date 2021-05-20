module Main where

import GHC.Generics
import Data.Aeson
import qualified Data.Text as Text
import qualified Data.Time as Time
import qualified Web.Scotty as Scotty

data Course = Course 
  { id :: Int
  , name :: String
  , status :: Status
  , createdAt :: Time.UTCTime
  } deriving (Generic, Show)

instance ToJSON Course
instance FromJSON Course

data Status = Scheduled | InProduction | Available
  deriving (Show)

instance ToJSON Status where
  toJSON status = toJSON $ statusToText status

statusToText :: Status -> Text.Text
statusToText status = case status of
    Scheduled -> "scheduled"
    InProduction -> "in_production"
    Available -> "available"

instance FromJSON Status where
  parseJSON = withText "Status" $ \txt -> 
      case textToStatus txt of
        Right s -> pure s
        Left err -> undefined

textToStatus :: Text.Text -> Either Text.Text Status
textToStatus text = case text of 
    "scheduled" -> Right Scheduled
    "in_production" -> Right InProduction
    "available" -> Right Available
    _ -> Left "Invalid status"

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