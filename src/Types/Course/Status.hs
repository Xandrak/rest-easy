module Types.Course.Status where

import Data.Aeson
import qualified Data.Text as Text

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
      Left err -> undefined -- TODO: Handle failure

textToStatus :: Text.Text -> Either Text.Text Status
textToStatus text = case text of
  "scheduled" -> Right Scheduled
  "in_production" -> Right InProduction
  "available" -> Right Available
  _ -> Left "Invalid status"
