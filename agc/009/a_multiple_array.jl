parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, as, bs)
    s = 0
    for i in n:-1:1
        t = mod(-as[i] - s, bs[i])
        s += t
    end
    s
end

function main()
    n = parseint()
    as, bs = parsepoints(n)
    println(solve(n, as, bs))
end

main()
