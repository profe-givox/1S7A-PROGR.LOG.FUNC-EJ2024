
mifizzbuzz xs = [ if x>10 then "FIZZ!" else "BUZZ!" | x <- xs, odd(x)]


com = [ x*y | x <- [2,5,10], y <- [8,10,11]]
commay = [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

let adj =     ["Inteligente","Lento","Pelon","Alto","Flaco","Guapo","Gordo"]
let nom = ["DSherk","Rodri", "Orlando"]

conan = [a ++ " " ++ n |a <- adj, n <- nom]


length' xs = sum [1 | _ <- xs]

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]

 ll = [[ x | x <- xs, even x ] | xs <- xxs]
