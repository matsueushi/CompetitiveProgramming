const AMAX = 10^6

f(a, b) = (a + b) * (a^2 + b^2)
g(x) = f(x, x)
h(x) = f(x, 0)

function bisect(func, l, r)
    r - l == 1 && return r
    m = (r + l) ÷ 2
    func(m) ≥ 0 ? bisect(func, l, m) : bisect(func, m, r)
end

function solve(n)
    r = bisect(x -> h(x) - n, -1, AMAX)
    l = bisect(x -> g(x) - n, -1, r)
    ret = g(l)
    x = l
    for i in l:r
        x = bisect(x -> f(x, i) - n, -1, x)
        ret = min(ret, f(x, i))
    end
    ret
end

function main()
    n = parse(Int64, readline())
    println(solve(n))
end

main()
