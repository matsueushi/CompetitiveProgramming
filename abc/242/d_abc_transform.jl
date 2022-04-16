function solve(sc, t, k)
    t == 0 && return sc[k]
    k == 1 && return (sc[1] + t) % 3
    if k % 2 == 0
        (solve(sc, t - 1, k ÷ 2) + 2) % 3
    else
        (solve(sc, t - 1, (k + 1) ÷ 2) + 1) % 3
    end
end

function main()
    s = readline()
    q = parse(Int64, readline())
    sc = collect(s) .- 'A'
    for i in 1:q
        t, k = parse.(Int64, split(readline()))
        println(solve(sc, t, k) + 'A')
    end
end

main()
