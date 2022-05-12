function main()
    a, b, c = parse.(Int, split(readline()))
    (a == b == c && a % 2 == 0) && (println(-1); return)
    n = 0
    while a % 2 == 0 && b % 2 == 0 && c % 2 == 0
        n += 1
        a, b, c = (b + c) ÷ 2, (c + a) ÷ 2, (a + b) ÷ 2
    end
    println(n)
end

main()
