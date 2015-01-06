module Compressor where


import Utilities


-- |Data type for defining compressor parameters.
data Compressor = Compressor Double Double Double


-- |Returns the threshold of a compressor.
threshold :: Compressor -> Double
threshold (Compressor t _ _) = t


-- |Returns the compression ratio of a compressor.
ratio :: Compressor -> Double
ratio (Compressor _ r _) = r


-- |Returns the makeup gain of a compressor.
makeupGain :: Compressor -> Double
makeupGain (Compressor _ _ mg) = mg


-- |Applies a compressor to a list of samples.
compress :: Compressor -> [Double] -> [Double]
compress p []     = []
compress p (x:xs) = compressSample p x : compress p xs


-- |Applies a compressor to an individual sample.
compressSample :: Compressor -> Double -> Double
compressSample p x = applyMakeupGain p $ compressValue p x


-- |Internal compression stage of a compressor, applied to individual samples.
compressValue :: Compressor -> Double -> Double
compressValue p x =
  if x > db2amplitude (threshold p)
  then (x - db2amplitude (threshold p)) / ratio p + db2amplitude (threshold p)
  else x


-- |Internal make-up gain stage of a compressor, applied to individual samples.
applyMakeupGain :: Compressor -> Double -> Double
applyMakeupGain p x = x * db2amplitude (makeupGain p)
