{- I. EXAMPLE: -}
import Control.Parallel
import Control.Parallel.Strategies

main :: IO ()
main = do
  let result = parallelSum [1..100000000]
  print result

parallelSum :: [Int] -> Int
parallelSum xs = runEval $ do
  let len = length xs
  if len <= 25
    then return $ sum xs
    else do
      let (as, bs) = splitAt (len `div` 2) xs
      asSum <- rpar $ parallelSum as
      bsSum <- rpar $ parallelSum bs
      rseq asSum
      rseq bsSum
      return $ asSum + bsSum


{- II. EXAMPLE: -}
loop :: Int -> Int -> IO ()
loop current target
  | current > target = return () -- alapértelmezett eset, amikor a ciklus véget ér
  | otherwise = do
    putStrLn $ "Current number: " ++ show current
    loop (current + 1) target -- rekurzív hívás a következő iterációhoz

main :: IO ()
main = loop 1 10


{- III. EXAMPLE: -}
isEven :: Int -> Bool
isEven n = if n `mod` 2 == 0
              then True
              else False

main :: IO ()
main = do
  putStrLn "Kérlek, adj meg egy számot:"
  number <- getLine
  let parsedNumber = read number :: Int
  if isEven parsedNumber
    then putStrLn "A megadott szám páros."
    else putStrLn "A megadott szám páratlan."


{- IV. EXAMPLE: -}
checkSum :: Int -> Int -> Int -> Bool
checkSum firstNumber secondNumber thirdNumber = firstNumber + secondNumber == thirdNumber
main :: IO ()
main = do
    putStrLn "Első szám: "
    number <- getLine
    let firstNumber = read number :: Int
    putStrLn "Második szám: "
    number <- getLine
    let secondNumber = read number :: Int
    putStrLn "Harmadik szám: "
    number <- getLine
    let thirdNumber = read number :: Int
    let result = checkSum firstNumber secondNumber thirdNumber
    if result
        then putStrLn "Ügyes vagy!"
        else putStrLn ("Barom vagy! Az összeg: " ++ show (firstNumber + secondNumber))
-}

{- V. EXAMPLE: -}
loop :: Int -> Int -> Int -> Int -> Int -> IO ()
loop current numberM numberN numberP akku
  | current > numberM = putStrLn $ "Sum: " ++ show akku -- alapértelmezett eset, amikor a ciklus véget ér
  | otherwise = do
    let currentNumber = numberN `div` (numberP + (current-1))
    -- putStrLn $ "Current number: " ++ show currentNumber
    loop (current + 1) numberM numberN numberP (akku + currentNumber) -- rekurzív hívás a következő iterációhoz

main :: IO ()
main = loop 1 922 80 2 0

