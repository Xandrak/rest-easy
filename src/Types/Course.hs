module Types.Course where

import GHC.Generics
import Data.Aeson
import qualified Data.Time as Time
import qualified Types.Course.Status as Status

data Course = Course
  { id :: Int
  , name :: String
  , status :: Status.Status
  , createdAt :: Time.UTCTime
  }
  deriving (Generic, Show)

instance ToJSON Course

instance FromJSON Course
