const P = 998244353

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, ds)
    first(ds) != 0 && return 0
    used = zeros(Int, n)
    for i in 2:n
        used[ds[i]+1] += 1
    end
    used[1] != 0 && return 0
    res = 1
    for j in 2:n-1
        (used[j+1] > 0 && used[j] == 0) && return 0
    end

    used[1] = 1
    for j in 2:n
        res *= powermod(used[j-1], used[j], P)
        res %= P
    end
    res
end

function main()
    n = parseint()
    ds = parseints()
    println(solve(n, ds))
end

main()
