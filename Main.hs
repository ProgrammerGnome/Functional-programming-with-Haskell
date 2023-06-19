{-
	KöMaL S.141-es feladata
	Integer range: -9223372036854775808 - +9223372036854775807
-}


import Control.Parallel (par, pseq)
import System.CPUTime

calculate :: Int -> Int -> Int -> Int
calculate numberM numberN numberP = numberN `div` (numberP + (numberM-1))

parallelComputation :: Int -> Int -> Int -> Int
parallelComputation m n p = result `par` (result `pseq` result)
  where
    result = sum [calculate m n p | m <- [1..m]]

main :: IO ()
main = do
  startTime <- getCPUTime
  
  putStrLn "M: "
  number <- getLine
  let m = read number :: Int
  putStrLn "N: "
  number <- getLine
  let n = read number :: Int
  putStrLn "P: "
  number <- getLine
  let p = read number :: Int
  let result = parallelComputation m n p
  print result
  
  endTime <- getCPUTime
  let elapsedTime = fromIntegral (endTime - startTime) / (10^12)
  putStrLn $ "Time: " ++ show elapsedTime ++ " second"

