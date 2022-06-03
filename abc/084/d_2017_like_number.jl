using Primes

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(q, ls, rs)
    ps = primes(10^5)
    sim = Int[]
    for i in 3:2:10^5
        (i ∈ ps && (i + 1) ÷ 2 ∈ ps) && (push!(sim, i))
    end
    res = zeros(Int, q)
    for i in 1:q
        res[i] = searchsortedlast(sim, rs[i]) - searchsortedfirst(sim, ls[i]) + 1
    end
    res
end

function main()
    q = parseint()
    ls, rs = parsepoints(q)
    for x in solve(q, ls, rs)
        println(x)
    end
end

main()
