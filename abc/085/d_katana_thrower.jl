parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, h, as, bs)
    a = maximum(as)
    sort!(bs)
    life = h
    res = 0
    for i in n:-1:1
        bs[i] ≤ a && break
        res += 1
        life -= bs[i]
        life ≤ 0 && return res
    end
    res += cld(life, a)
    res
end

function main()
    n, h = parseints()
    as, bs = parsepoints(n)
    println(solve(n, h, as, bs))
end

main()
