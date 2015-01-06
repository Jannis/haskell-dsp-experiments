module Main where


import Utilities
import Compressor


-- |Test code.
main = let samples = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
           p = Compressor (-6.0) 2.0 0.0
       in do
           putStrLn ("Threshold:     " ++ showDB (threshold p))
           putStrLn ("Ratio:         " ++ show (ratio p) ++ ":1")
           putStrLn ("Make-up gain:  " ++ showDB (makeupGain p))
           putStrLn "---"
           putStrLn ("Samples (in):  " ++ "\n" ++ showSamples samples)
           putStrLn ("Samples (out): " ++ "\n" ++ showSamples (compress p samples))
