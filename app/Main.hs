module Main (main) where

import Data.List (isSuffixOf)
import System.Directory (listDirectory, doesDirectoryExist, doesFileExist)
import System.FilePath ((</>))

main :: IO ()
main = do
    putStrLn "Enter the filepath:"
    str <- getLine
    n <- countLines str
    putStrLn "Total lines in .hs files is:"
    putStrLn $ show n
    _ <- getChar
    return ()


--isSuffixOf :: String -> String -> Bool
--readFile :: FilePath -> IO String
--listDirectory :: FilePath -> IO [FilePath]
--doesDirectoryExist :: FilePath -> IO Boollines :: 
--lines :: String -> [String]
--mapM :: (a -> IO b) -> [a] -> IO [b]

countLines :: FilePath -> IO Int
countLines filepath = do
    isDirExist <- doesDirectoryExist filepath
    if isDirExist
        then do
            names <- listDirectory filepath
            ns <- mapM countLines $ map (filepath </>) $ filter (/= ".stack-work") names
            return $ sum ns
        else do
            isFileExist <- doesFileExist filepath
            if isFileExist && (".hs" `isSuffixOf` filepath)
                then do 
                    str <- readFile filepath
                    putStrLn filepath
                    return (length (lines str))
                else do
                    return 0
