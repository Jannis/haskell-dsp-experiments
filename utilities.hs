module Utilities where


-- |Converts an amplitude value (between -1.0 to 1.0) to a dB value.
amplitude2db :: Double -> Double
amplitude2db x = 20.0 * logBase 10.0 x


-- |Converts a dB value (e.g. -6.0 for -6.0dB) to an amplitude value.
db2amplitude :: Double -> Double
db2amplitude x = 10.0 ** (x / 20.0)


-- |Renders an amplitude value to a string.
showAmplitude :: Double -> String
showAmplitude x = show (amplitude2db x) ++ "dB" ++ " (" ++ show x ++ ")"


-- |Renders a dB value to a string.
showDB :: Double -> String
showDB x = show x ++ "dB" ++ " (" ++ show (db2amplitude x) ++ ")"


-- |Renders an list of samples to a string.
showSamples :: [Double] -> String
showSamples []     = ""
showSamples (x:xs) = "  " ++ showAmplitude x ++ "\n" ++ showSamples xs
