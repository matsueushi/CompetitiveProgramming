function main()
    n = parse(Int, readline())
    cs = zeros(Int, n)
    as, bs = zeros(Int, n), zeros(Int, n)
    for i in 1:n-1
        a, b = parse.(Int, split(readline()))
        cs[a] += 1
        cs[b] += 1
    end
    for c in cs
        c == n - 1 && (println("Yes"); return)
    end
    println("No")
end

main()
